#pragma once

#include <algorithm>
#include <cstdint>
#include <span>
#include <string>
#include <string_view>
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

static constexpr size_t CHAR_SIZE = 256;

class THuffDecoder : public IDecoder {
public:
    struct TWriteData {
        TString OutData{};
        uint64_t BitBuffer{0};
        int BitsInBuffer{0};
    };

    explicit THuffDecoder(const std::span<const uint64_t> charStats);
    uint8_t GetNext(TStringView data, size_t& bitPtr) override;
    std::tuple<TString, size_t> Write(TStringView inData) override;
    void BufferedWrite(TStringView inData, TWriteData& writeData);
private:
    using TInd = uint16_t;
    static constexpr size_t SZ = CHAR_SIZE * 2 - 1;
    std::array<std::array<uint16_t, 2>, SZ> Tree_{};

    std::array<uint64_t, CHAR_SIZE> Codes_{};
    std::array<uint8_t, CHAR_SIZE> Lens_{};
};

class TPredHuffDecoder : public IDecoder {
public:
    explicit TPredHuffDecoder(const std::vector<std::vector<uint64_t>>& statTable);
    uint8_t GetNext(TStringView data, size_t& bitPtr) override;
    std::tuple<TString, size_t> Write(TStringView inData) override;
    void Reset() override { LastChar_ = 0; }
private:
    std::vector<THuffDecoder> InnerHuffmans_;
    uint8_t LastChar_{0};
};

} // namespace NDecoder
