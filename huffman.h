#pragma once

#include "stat.h"
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

template <size_t TABLE_BITS>
class THuffDecoder : public IDecoder {
    using TInd = uint16_t;

   public:
    // Table entry: decoded symbol + number of bits consumed
    struct TTableEntry {
        uint8_t Symbol;
        uint8_t BitsConsumed;  // 0 = incomplete code (need more bits)
    };

    explicit THuffDecoder(const std::span<const uint64_t> charStats);
    uint8_t GetNext(TStringView data, size_t& bitPtr) override;
    uint8_t GetNextFromTree(TInd c, TStringView data, size_t& bitPtr);
    std::tuple<TString, size_t> Write(TStringView inData) override;
    void BufferedWrite(TStringView inData, TWriteData& writeData);

   private:
    static constexpr size_t SZ = CHAR_SIZE * 2 - 1;
    std::array<uint16_t, SZ * 2> Tree_{};

    std::array<uint64_t, CHAR_SIZE> Codes_{};
    std::array<uint8_t, CHAR_SIZE> Lens_{};

    static constexpr size_t TABLE_SIZE = (1UL << TABLE_BITS);
    static constexpr size_t TABLE_MASK = TABLE_SIZE - 1;
    std::array<TTableEntry, TABLE_SIZE> DecodeTable_{};
};

template <size_t TABLE_BITS>
class TPredHuffDecoder : public IDecoder {
    std::array<uint8_t, CHAR_SIZE * CHAR_SIZE> HuffIndex_;
    std::vector<std::unique_ptr<THuffDecoder<TABLE_BITS>>> InnerHuffmans_;
    uint16_t Predicate_{0};

   public:
    explicit TPredHuffDecoder(const NStat::TPredStat& stats);
    uint8_t GetNext(TStringView data, size_t& bitPtr) override;
    std::tuple<TString, size_t> Write(TStringView inData) override;
    void Reset() override {
        Predicate_ = 0;
    }
    [[nodiscard]] size_t GetClustersCount() const { return InnerHuffmans_.size(); }

   private:
    THuffDecoder<TABLE_BITS>& GetHuffman(uint16_t predicate);
};

}  // namespace NDecoder
