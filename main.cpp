#include "huffman.h"
#include "stat.h"
#include "utils.h"

#include <benchmark/benchmark.h>
#include <cassert>
#include <fstream>
#include <iomanip>
#include <memory>
#include <optional>
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

template <size_t TABLE_BITS>
static auto Init(std::optional<int> limit, const std::string& trainFileName, const std::string& msg) {
    auto stat = NStat::GetTopPredicates(readFile(trainFileName), limit.value_or(1));

    std::unique_ptr<IDecoder> decoder;
    if (limit.has_value()) {
        decoder = std::make_unique<NDecoder::TPredHuffDecoder<TABLE_BITS>>(stat);
    } else {
        decoder = std::make_unique<NDecoder::THuffDecoder<TABLE_BITS>>(stat[0]);
    }

    auto [coded, bitSize] = decoder->Write(msg);
    return std::make_tuple(std::move(decoder), std::move(coded), bitSize);
}

template <size_t TABLE_BITS>
static void TestMain(benchmark::State& state, std::optional<int> limit, const std::string& trainFileName,
                     const std::string& testFileName) {
    const auto msg = readFile(testFileName);
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
    state.counters["compression"] = 1e2 * (1 - (static_cast<double>(coded.size()) / static_cast<double>(msg.size())));
    state.SetItemsProcessed(state.iterations() * std::ssize(msg));
}

class CustomReporter : public benchmark::ConsoleReporter {
   public:
    void ReportRuns(const std::vector<Run>& reports) override {
        for (const auto& run : reports) {
            std::cout << std::setw(20) << run.benchmark_name();
            for (const auto& [key, value] : run.counters) {
                if (key == "compression") {
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
        for (int limit = 16; limit <= 2048; limit *= 2) {
            RegisterBenchmark<4>(limit, trainName, testName);
            RegisterBenchmark<6>(limit, trainName, testName);
            RegisterBenchmark<8>(limit, trainName, testName);
            RegisterBenchmark<10>(limit, trainName, testName);
            RegisterBenchmark<12>(limit, trainName, testName);
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
    const auto msg = readFile("text.txt");
    Debug(__LINE__);
    auto [decoder, coded, outBitPtr] = Init<5>({}, "haier.txt", msg);
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
