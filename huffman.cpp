#include "huffman.h"

#include "utils.h"

#include <cassert>
#include <cstdint>
#include <functional>
#include <queue>

namespace NDecoder {

template <size_t TABLE_BITS>
THuffDecoder<TABLE_BITS>::THuffDecoder(const std::span<const uint64_t> charStats) {
    DecodeTable_.fill({.Symbol = 0, .BitsConsumed = 0});
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
        Tree_[c * 2] = Tree_[c * 2 + 1] = c;
    }

    for (TInd c = CHAR_SIZE; c < SZ; c++) {
        auto min1 = q.top();
        q.pop();
        auto min2 = q.top();
        q.pop();
        q.push(T{.Value = (min1.Value + min2.Value), .Char = c});
        Tree_[c * 2] = min1.Char;
        Tree_[c * 2 + 1] = min2.Char;
        parentAndBit[min1.Char] = {c, 0};
        parentAndBit[min2.Char] = {c, 1};
    }
    assert(q.size() == 1);

    std::vector<size_t> path;

    for (size_t c = 0; c < CHAR_SIZE; c++) {
        uint8_t& len = Lens_[c];
        uint64_t& code = Codes_[c];
        len = code = 0;

        path.clear();
        for (size_t cur = c; cur != SZ - 1; cur = parentAndBit[cur].first) {
            path.push_back(cur);
            len++;
            code = ((code << 1) | parentAndBit[cur].second);
        }

        if (0 < len && len <= TABLE_BITS) {
            for (uint32_t extra = 0; extra < (1U << (TABLE_BITS - len)); extra++) {
                uint64_t idx = code | (extra << len);
                DecodeTable_[idx] = {.Symbol = static_cast<uint8_t>(c), .BitsConsumed = len};
            }
        }

        if (len > TABLE_BITS) {
            auto ch = path[path.size() - TABLE_BITS];
            DecodeTable_[code & TABLE_MASK] = {.Symbol = static_cast<uint8_t>(ch), .BitsConsumed = 0};
        }
    }
}

template <size_t TABLE_BITS>
inline uint8_t THuffDecoder<TABLE_BITS>::GetNextFromTree(TInd c, TStringView data, size_t& bitPtr) {
    const auto* bytes = reinterpret_cast<const uint8_t*>(data.data());
    size_t localBitPtr = bitPtr;

    while (c >= CHAR_SIZE) {
        const uint8_t bit = (bytes[localBitPtr >> 3] >> (localBitPtr & 7)) & 1;
        c = Tree_[c * 2 + bit];
        ++localBitPtr;
    }

    bitPtr = localBitPtr;
    return static_cast<uint8_t>(c);
}

template <size_t TABLE_BITS>
uint8_t THuffDecoder<TABLE_BITS>::GetNext(TStringView data, size_t& bitPtr) {
    const auto* bytes = reinterpret_cast<const uint8_t*>(data.data());
    const size_t byteIdx = bitPtr >> 3;
    const size_t bitOff = bitPtr & 7;

    uint32_t window;
    __builtin_memcpy(&window, bytes + byteIdx, sizeof(window));  // single load

    const uint32_t bits = (window >> bitOff) & TABLE_MASK;
    const TTableEntry entry = DecodeTable_[bits];

    if (entry.BitsConsumed > 0) [[likely]] {
        bitPtr += entry.BitsConsumed;
        return entry.Symbol;
    }

    bitPtr += TABLE_BITS;
    return GetNextFromTree(CHAR_SIZE + entry.Symbol, data, bitPtr);
}

template <size_t TABLE_BITS>
void THuffDecoder<TABLE_BITS>::BufferedWrite(TStringView inData, TWriteData& writeData) {
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

template <size_t TABLE_BITS>
std::tuple<TString, size_t> THuffDecoder<TABLE_BITS>::Write(TStringView inData) {
    TWriteData writeData;
    writeData.OutData.reserve((inData.size() * 8 + 7) / 8 + 1);

    BufferedWrite(inData, writeData);

    size_t bitSize = writeData.OutData.size() * 8 + writeData.BitsInBuffer;

    if (writeData.BitsInBuffer > 0) {
        writeData.OutData.push_back(static_cast<char>(writeData.BitBuffer & 0xFF));
    }

    return {std::move(writeData.OutData), bitSize};
}

template <size_t TABLE_BITS>
TPredHuffDecoder<TABLE_BITS>::TPredHuffDecoder(const NStat::TPredStat& stats) : HuffIndex_(stats.ClusterID) {
    InnerHuffmans_.reserve(stats.ClusterStat.size());
    for (const auto& stat : stats.ClusterStat) {
        InnerHuffmans_.push_back(std::make_unique<THuffDecoder<TABLE_BITS>>(stat));
    }
}

template <size_t TABLE_BITS>
THuffDecoder<TABLE_BITS>& TPredHuffDecoder<TABLE_BITS>::GetHuffman(uint16_t predicate) {
    return *InnerHuffmans_[HuffIndex_[predicate]];
}

template <size_t TABLE_BITS>
uint8_t TPredHuffDecoder<TABLE_BITS>::GetNext(TStringView data, size_t& bitPtr) {
    auto res = GetHuffman(Predicate_).GetNext(data, bitPtr);
    Predicate_ = ((Predicate_ << 8) | static_cast<uint16_t>(res));
    return res;
}

template <size_t TABLE_BITS>
std::tuple<TString, size_t> TPredHuffDecoder<TABLE_BITS>::Write(TStringView inData) {
    TWriteData writeData;
    writeData.OutData.reserve((inData.size() * 8 + 7) / 8 + 1);

    uint16_t predicate = 0;
    for (size_t i = 0; i < inData.length(); i++) {
        GetHuffman(predicate).BufferedWrite(inData.substr(i, 1), writeData);
        predicate = ((predicate << 8) | static_cast<uint16_t>(static_cast<uint8_t>(inData[i])));
    }

    size_t bitSize = writeData.OutData.size() * 8 + writeData.BitsInBuffer;

    if (writeData.BitsInBuffer > 0) {
        writeData.OutData.push_back(static_cast<char>(writeData.BitBuffer & 0xFF));
    }

    return {writeData.OutData, bitSize};
}

// template class THuffDecoder<1>;
// template class THuffDecoder<2>;
// template class THuffDecoder<3>;
// template class THuffDecoder<4>;
// template class THuffDecoder<5>;
// template class THuffDecoder<6>;
// template class THuffDecoder<7>;
template class THuffDecoder<8>;
// template class THuffDecoder<9>;
// template class THuffDecoder<10>;
// template class THuffDecoder<11>;
// template class THuffDecoder<12>;
// template class THuffDecoder<13>;
// template class THuffDecoder<14>;

// template class TPredHuffDecoder<1>;
// template class TPredHuffDecoder<2>;
// template class TPredHuffDecoder<3>;
// template class TPredHuffDecoder<4>;
// template class TPredHuffDecoder<5>;
// template class TPredHuffDecoder<6>;
// template class TPredHuffDecoder<7>;
template class TPredHuffDecoder<8>;
// template class TPredHuffDecoder<9>;
// template class TPredHuffDecoder<10>;
// template class TPredHuffDecoder<11>;
// template class TPredHuffDecoder<12>;
// template class TPredHuffDecoder<13>;
// template class TPredHuffDecoder<14>;

}  // namespace NDecoder
