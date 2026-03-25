#include "huffman.h"

#include <cassert>
#include <functional>
#include <iostream>
#include <queue>

namespace NDecoder {

THuffDecoder::THuffDecoder(const std::span<const uint64_t> charStats) {
    using TInd = uint16_t;
    constexpr auto SZ = CHAR_SIZE * 2 - 1;
    std::array<std::pair<TInd, uint8_t>, SZ> parentAndBit;

    struct T { uint64_t Value; TInd Char; auto operator<=>(const T&) const = default; };
    std::priority_queue<T, std::vector<T>, std::greater<>> q;

    for (TInd c = 0; c < CHAR_SIZE; c++) {
        q.push(T{.Value=charStats[c], .Char=c});
    }

    for (TInd c = CHAR_SIZE; c < SZ; c++) {
        auto min1 = q.top();
        q.pop();
        auto min2 = q.top();
        q.pop();
        q.push(T{.Value=(min1.Value + min2.Value), .Char=c});
        Tree_[c] = {min1.Char, min2.Char};
        parentAndBit[min1.Char] = {c, 0};
        parentAndBit[min2.Char] = {c, 1};
    }
    assert(q.size() == 1);
    for (size_t c = 0; c < CHAR_SIZE; c++) {
        Codes_[c] = Lens_[c] = 0;

        for (size_t cur = c; cur != SZ - 1; cur = parentAndBit[cur].first) {
            Lens_[c]++;
            Codes_[c] = ((Codes_[c] << 1) | parentAndBit[cur].second);
        }
    }
}

uint8_t THuffDecoder::GetNext(TStringView data, size_t& bitPtr) {
    TInd c = SZ - 1;
    while (c >= CHAR_SIZE) {
        auto bit = ((static_cast<uint8_t>(data[bitPtr >> 3]) >> (bitPtr & 7)) & 1);
        c = Tree_[c][bit];
        bitPtr++;
    }
    return c;
}

void THuffDecoder::BufferedWrite(TStringView inData, TWriteData& writeData) {
    auto& [outData, bitBuffer, bitsInBuffer] = writeData;
    for (uint8_t c : inData) {
        bitBuffer    |= static_cast<uint64_t>(Codes_[c]) << bitsInBuffer;
        bitsInBuffer += Lens_[c];

        while (bitsInBuffer >= 8) {
            outData.push_back(static_cast<char>(bitBuffer & 0xFF));
            bitBuffer    >>= 8;
            bitsInBuffer  -= 8;
        }
    }
}

std::tuple<TString, size_t> THuffDecoder::Write(TStringView inData) {
    THuffDecoder::TWriteData writeData;
    writeData.OutData.reserve((inData.size() * 8 + 7) / 8 + 1);

    BufferedWrite(inData, writeData);

    size_t bitSize = writeData.OutData.size() * 8 + writeData.BitsInBuffer;

    if (writeData.BitsInBuffer > 0) {
        writeData.OutData.push_back(static_cast<char>(writeData.BitBuffer & 0xFF));
    }

    return {std::move(writeData.OutData), bitSize};
}

TPredHuffDecoder::TPredHuffDecoder(const std::vector<std::vector<uint64_t>>& statTable) {
    InnerHuffmans_.reserve(statTable.size());
    for (const auto& statLine : statTable) {
        InnerHuffmans_.emplace_back(statLine);
    }
}

uint8_t TPredHuffDecoder::GetNext(TStringView data, size_t& bitPtr) {
    auto res = InnerHuffmans_[LastChar_].GetNext(data, bitPtr);
    return LastChar_ = res;
}

std::tuple<TString, size_t> TPredHuffDecoder::Write(TStringView inData) {
    THuffDecoder::TWriteData writeData;
    writeData.OutData.reserve((inData.size() * 8 + 7) / 8 + 1);

    uint8_t last = 0;
    for (size_t i = 0; i < inData.length(); i++) {
        InnerHuffmans_[last].BufferedWrite(inData.substr(i, 1), writeData);
        last = inData[i];
    }

    size_t bitSize = writeData.OutData.size() * 8 + writeData.BitsInBuffer;

    if (writeData.BitsInBuffer > 0) {
        writeData.OutData.push_back(static_cast<char>(writeData.BitBuffer & 0xFF));
    }

    return {writeData.OutData, bitSize};
}

} // namespace NDecoder
