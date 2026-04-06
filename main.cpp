#include "huffman.h"
#include "stat.h"
#include "utils.h"

#include <benchmark/benchmark.h>
#include <cassert>
#include <cstring>
#include <fstream>
#include <iconv.h>
#include <iomanip>
#include <memory>
#include <vector>

std::string readFile(const std::string& name) {
    std::string text, line;
    std::ifstream fi("/home/sert/md/sert-compress/data/" + name);
    while (getline(fi, line)) {
        text += line + "\n";
    }
    fi.close();
    return text;
}

std::string ReadFileAsCP1251(const std::string& name) {
    // Read UTF-8 file
    std::ifstream file("/home/sert/md/sert-compress/data/" + name, std::ios::binary);
    if (!file) {
        throw std::runtime_error("Cannot open file: " + name);
    }

    std::string utf8((std::istreambuf_iterator<char>(file)), std::istreambuf_iterator<char>());

    // Convert UTF-8 -> CP1251
    iconv_t cd = iconv_open("CP1251", "UTF-8");
    if (cd == (iconv_t)-1) {
        throw std::runtime_error("iconv_open failed");
    }

    // Worst case: same size (UTF-8 Cyrillic is 2 bytes, CP1251 is 1)
    std::string cp1251(utf8.size(), '\0');

    char* inBuf = utf8.data();
    char* outBuf = cp1251.data();
    size_t inLeft = utf8.size();
    size_t outLeft = cp1251.size();

    while (inLeft > 0) {
        size_t ret = iconv(cd, &inBuf, &inLeft, &outBuf, &outLeft);
        if (ret == (size_t)-1) {
            if (errno == EILSEQ || errno == EINVAL) {
                // Skip one byte and continue
                inBuf++;
                inLeft--;
            } else {
                iconv_close(cd);
                throw std::runtime_error("iconv failed: " + std::string(strerror(errno)));
            }
        }
    }

    iconv_close(cd);
    cp1251.resize(cp1251.size() - outLeft);
    return cp1251;
}

template <size_t TABLE_BITS>
static auto Init(int limit, const std::string& trainFileName, const std::string& msg) {
    static std::map<std::pair<std::string, int>, NStat::TPredStat> mem;
    auto key = std::make_pair(trainFileName, limit);
    if (!mem.contains(key)) {
        mem[key] = NStat::GetClusteredStat(ReadFileAsCP1251(trainFileName), limit);
    }
    auto stat = mem.at(key);
    auto decoder = std::make_unique<NDecoder::TPredHuffDecoder<TABLE_BITS>>(stat);

    auto [coded, bitSize] = decoder->Write(msg);
    return std::make_tuple(std::move(decoder), std::move(coded), bitSize);
}

template <size_t TABLE_BITS>
static void TestMain(benchmark::State& state, int limit, const std::string& trainFileName,
                     const std::string& testFileName) {
    const auto msg = ReadFileAsCP1251(testFileName);
    auto [decoder, coded, outBitPtr] = Init<TABLE_BITS>(limit, trainFileName, msg);
    const auto newLen = (outBitPtr + 7) / 8;

    for (auto _ : state) {
        decoder->Reset();
        size_t inBitPtr = 0;
        TString restored;
        while (inBitPtr < outBitPtr) {
            restored.push_back(static_cast<char>(decoder->GetNext(coded, inBitPtr)));
        }

        if (msg != restored) {
            auto oldLen = static_cast<double>(msg.size());
            Debug("Fail:", msg.size(), "->", newLen, (oldLen - static_cast<double>(newLen)) / oldLen * 1e2, "%");
            Debug(msg.size(), restored.size());
            exit(1);
        }
    }
    state.counters["it"] = state.iterations();
    state.counters["clusters"] = decoder->GetClustersCount();
    state.counters["compression"] = 1e2 * (1 - (static_cast<double>(coded.size()) / static_cast<double>(msg.size())));
    state.SetItemsProcessed(state.iterations() * std::ssize(msg));
}

class CustomReporter : public benchmark::ConsoleReporter {
   public:
    void ReportRuns(const std::vector<Run>& reports) override {
        for (const auto& run : reports) {
            std::cout << std::setw(20) << run.benchmark_name();
            for (const auto& [key, value] : run.counters) {
                if (key == "clusters" || key == "it") {
                    std::cout << " " + key + ": " << static_cast<int>(value);
                } else if (key == "compression") {
                    std::cout << " compression: " << std::setprecision(1) << std::fixed << value << "%";
                } else if (key == "items_per_second") {
                    std::cout << " rps: " << std::setprecision(1) << std::fixed << value / (1 << 20) << " MB/s";
                } else {
                    std::cout << " " << key << ": " << value;
                }
            }
            std::cout << "\n";
        }
    }
};

template <size_t TABLE_BITS>
void RegisterBenchmark(int limit, const std::string& trainName, const std::string& testName) {
    std::string name = trainName.substr(0, 3) + "-" + testName.substr(0, 3) + "-" + std::to_string(TABLE_BITS) + "-"
                       + std::to_string(limit);
    benchmark::RegisterBenchmark(
        name, [=](benchmark::State& state) { TestMain<TABLE_BITS>(state, limit, trainName, testName); });
}

int main(int argc, char** argv) {
    CustomReporter reporter;

    auto Reg = [](const std::string& trainName, const std::string& testName) {
        for (int limit = 230; limit <= 234; limit += 1) {
            // RegisterBenchmark<4>(limit, trainName, testName);
            // RegisterBenchmark<6>(limit, trainName, testName);
            // RegisterBenchmark<7>(limit, trainName, testName);
            RegisterBenchmark<8>(limit, trainName, testName);
            // RegisterBenchmark<9>(limit, trainName, testName);
            // RegisterBenchmark<10>(limit, trainName, testName);
        }
    };
    Reg("fast_ru.txt", "haier.txt");

    benchmark::Initialize(&argc, argv);
    benchmark::SetDefaultTimeUnit(benchmark::kSecond);

    benchmark::RunSpecifiedBenchmarks(&reporter);
    benchmark::Shutdown();
    return 0;
}

int main1() {
    Debug(__LINE__);
    const auto msg = ReadFileAsCP1251("text.txt");
    Debug(__LINE__);
    auto [decoder, coded, outBitPtr] = Init<8>(5, "haier.txt", msg);
    Debug(__LINE__, coded.size(), outBitPtr);

    for (int it = 0; it < 3; it++) {
        Debug(it, __LINE__);
        decoder->Reset();
        Debug(it, __LINE__);
        size_t inBitPtr = 0;
        TString restored;
        Debug(it, __LINE__);
        while (inBitPtr < outBitPtr) {
            Debug(it, __LINE__, inBitPtr, outBitPtr);
            restored.push_back(static_cast<char>(decoder->GetNext(coded, inBitPtr)));
            Debug(it, __LINE__, inBitPtr, outBitPtr);
        }

        Debug(it, __LINE__);
        if (msg != restored) {
            Debug(it, __LINE__);
            auto oldLen = static_cast<double>(msg.size());
            auto newLen = (outBitPtr + 7) / 8;
            Debug("Fail:", msg.size(), "->", newLen, (oldLen - static_cast<double>(newLen)) / oldLen * 1e2, "%");
            Debug(msg.size(), restored.size());
            Debug(msg, restored);
            exit(1);
        } else {
            Debug(it, __LINE__);
            Debug("OK!");
        }
        Debug(it, __LINE__);
    }
    return 0;
}
