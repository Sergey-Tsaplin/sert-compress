#include "huffman.h"

#include "utils.h"

#include <cassert>
#include <cstdint>
#include <functional>
#include <queue>
#include <stdexcept>

namespace NDecoder {

THuffDecoder::THuffDecoder(const std::span<const uint64_t> charStats, size_t tableBits)
    : TableBits_(tableBits)
    , TableSize_(1U << tableBits)
    , DecodeTable_(TableSize_, {.Symbol = 0, .BitsConsumed = 0})
{
    using TInd = uint16_t;
    constexpr auto SZ = CHAR_SIZE * 2 - 1;
    std::array<std::pair<TInd, uint8_t>, SZ> parentAndBit;

    struct T {
        uint64_t Value;
        TInd Char;
        auto operator<=>(const T&) const = default;
    };
    std::priority_queue<T, std::vector<T>, std::greater<>> q;

    // Ensure all symbols are present with at least frequency 1
    // to avoid zero-length codes and degenerate trees
    for (TInd c = 0; c < CHAR_SIZE; c++) {
        q.push(T{.Value = charStats[c] + 1, .Char = c});
    }

    for (TInd c = CHAR_SIZE; c < SZ; c++) {
        auto min1 = q.top();
        q.pop();
        auto min2 = q.top();
        q.pop();
        q.push(T{.Value = (min1.Value + min2.Value), .Char = c});
        Tree_[c] = {min1.Char, min2.Char};
        parentAndBit[min1.Char] = {c, 0};
        parentAndBit[min2.Char] = {c, 1};
    }
    assert(q.size() == 1);

    for (size_t c = 0; c < CHAR_SIZE; c++) {
        uint8_t& len = Lens_[c];
        uint64_t& code = Codes_[c];
        len = code = 0;

        for (size_t cur = c; cur != SZ - 1; cur = parentAndBit[cur].first) {
            len++;
            code = ((code << 1) | parentAndBit[cur].second);
        }

        if (0 < len && len <= TableBits_) {
            for (uint32_t extra = 0; extra < (1U << (TableBits_ - len)); extra++) {
                uint64_t idx = code | (extra << len);
                DecodeTable_[idx] = {.Symbol = static_cast<uint8_t>(c), .BitsConsumed = len};
            }
        }
    }
}

uint8_t THuffDecoder::GetNext(TStringView data, size_t& bitPtr) {
    const size_t byteIdx = bitPtr >> 3;

    if (byteIdx + 2 < data.size()) [[likely]] {
        const uint32_t window = static_cast<uint8_t>(data[byteIdx])
                                | (static_cast<uint32_t>(static_cast<uint8_t>(data[byteIdx + 1])) << 8)
                                | (static_cast<uint32_t>(static_cast<uint8_t>(data[byteIdx + 2])) << 16);
        uint32_t bits = (window >> (bitPtr & 7)) & (TableSize_ - 1);
        const auto& entry = DecodeTable_[bits];
        if (entry.BitsConsumed > 0) [[likely]] {
            bitPtr += entry.BitsConsumed;
            return entry.Symbol;
        }
    }

    TInd c = SZ - 1;
    while (c >= CHAR_SIZE) {
        auto bit = ((static_cast<uint8_t>(data[bitPtr >> 3]) >> (bitPtr & 7)) & 1);
        c = Tree_[c][bit];
        bitPtr++;
    }
    return static_cast<uint8_t>(c);
}

void THuffDecoder::BufferedWrite(TStringView inData, TWriteData& writeData) {
    auto& [outData, bitBuffer, bitsInBuffer] = writeData;
    for (uint8_t c : inData) {
        bitBuffer |= static_cast<uint64_t>(Codes_[c]) << bitsInBuffer;
        bitsInBuffer += Lens_[c];

        while (bitsInBuffer >= 8) {
            outData.push_back(static_cast<char>(bitBuffer & 0xFF));
            bitBuffer >>= 8;
            bitsInBuffer -= 8;
        }
    }
}

std::tuple<TString, size_t> THuffDecoder::Write(TStringView inData) {
    TWriteData writeData;
    writeData.OutData.reserve((inData.size() * 8 + 7) / 8 + 1);

    BufferedWrite(inData, writeData);

    size_t bitSize = writeData.OutData.size() * 8 + writeData.BitsInBuffer;

    if (writeData.BitsInBuffer > 0) {
        writeData.OutData.push_back(static_cast<char>(writeData.BitBuffer & 0xFF));
    }

    return {std::move(writeData.OutData), bitSize};
}

TPredHuffDecoder::TPredHuffDecoder(const std::unordered_map<uint32_t, TStat>& stats, size_t tableBits) {
    for (const auto& [pred, stat] : stats) {
        InnerHuffmans_[pred] = std::make_unique<THuffDecoder>(stat, tableBits);
    }
}

THuffDecoder& TPredHuffDecoder::GetHuffman(uint32_t predicate) {
    for (const auto and_mask : AND_MASKS) {
        if (auto& huffPtr = InnerHuffmans_[predicate & and_mask]) {
            return *huffPtr;
        }
    }
    throw std::runtime_error("Can't find huffman for " + std::to_string(Predicate_));
}

uint8_t TPredHuffDecoder::GetNext(TStringView data, size_t& bitPtr) {
    auto res = GetHuffman(Predicate_).GetNext(data, bitPtr);
    Predicate_ = ((Predicate_ << 8) | static_cast<uint32_t>(res));
    return res;
}

std::tuple<TString, size_t> TPredHuffDecoder::Write(TStringView inData) {
    TWriteData writeData;
    writeData.OutData.reserve((inData.size() * 8 + 7) / 8 + 1);

    uint32_t predicate = 0;
    for (size_t i = 0; i < inData.length(); i++) {
        GetHuffman(predicate).BufferedWrite(inData.substr(i, 1), writeData);
        predicate = ((predicate << 8) | static_cast<uint32_t>(static_cast<uint8_t>(inData[i])));
    }

    size_t bitSize = writeData.OutData.size() * 8 + writeData.BitsInBuffer;

    if (writeData.BitsInBuffer > 0) {
        writeData.OutData.push_back(static_cast<char>(writeData.BitBuffer & 0xFF));
    }

    return {writeData.OutData, bitSize};
}

}  // namespace NDecoder
