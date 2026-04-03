#pragma once

#include "utils.h"

#include <algorithm>
#include <cstdint>
#include <memory>
#include <span>
#include <string>
#include <string_view>
#include <unordered_map>
#include <vector>

using TString = std::basic_string<char>;
using TStringView = std::basic_string_view<char>;

struct IDecoder {
    virtual ~IDecoder() = default;
    virtual uint8_t GetNext(TStringView data, size_t& bitPtr) = 0;
    virtual std::tuple<TString, size_t> Write(TStringView inData) = 0;
    virtual void Reset() {}
};

namespace NDecoder {

struct TWriteData {
    TString OutData{};
    uint64_t BitBuffer{0};
    int BitsInBuffer{0};
};

class THuffDecoder : public IDecoder {
   public:
    // Table entry: decoded symbol + number of bits consumed
    struct TTableEntry {
        uint8_t Symbol;
        uint8_t BitsConsumed;  // 0 = incomplete code (need more bits)
    };

    THuffDecoder(const std::span<const uint64_t> charStats, size_t tableBits);
    uint8_t GetNext(TStringView data, size_t& bitPtr) override;
    std::tuple<TString, size_t> Write(TStringView inData) override;
    void BufferedWrite(TStringView inData, TWriteData& writeData);

   private:
    using TInd = uint16_t;
    static constexpr size_t SZ = CHAR_SIZE * 2 - 1;
    std::array<std::array<uint16_t, 2>, SZ> Tree_{};

    std::array<uint64_t, CHAR_SIZE> Codes_{};
    std::array<uint8_t, CHAR_SIZE> Lens_{};

    size_t TableBits_;
    size_t TableSize_;
    std::vector<TTableEntry> DecodeTable_{};
};

class TPredHuffDecoder : public IDecoder {
   public:
    TPredHuffDecoder(const std::unordered_map<uint32_t, TStat>& stats, size_t tableBits);
    uint8_t GetNext(TStringView data, size_t& bitPtr) override;
    std::tuple<TString, size_t> Write(TStringView inData) override;
    void Reset() override { Predicate_ = 0; }

   private:
    THuffDecoder& GetHuffman(uint32_t predicate);
    std::array<std::unique_ptr<THuffDecoder>, CHAR_SIZE * CHAR_SIZE> InnerHuffmans_;
    uint32_t Predicate_{0};
};

}  // namespace NDecoder
