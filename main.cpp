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

static auto Init(std::optional<int> limit, size_t tableBits, const std::string& trainFileName, const std::string& msg) {
    auto stat = NStat::GetTopPredicates(readFile(trainFileName), limit.value_or(1));

    std::unique_ptr<IDecoder> decoder;
    if (limit.has_value()) {
        decoder = std::make_unique<NDecoder::TPredHuffDecoder>(stat, tableBits);
    } else {
        decoder = std::make_unique<NDecoder::THuffDecoder>(stat[0], tableBits);
    }

    auto [coded, bitSize] = decoder->Write(msg);
    return std::make_tuple(std::move(decoder), std::move(coded), bitSize);
}

static void TestMain(benchmark::State& state, std::optional<int> limit, size_t tableBits,
                     const std::string& trainFileName, const std::string& testFileName) {
    const auto msg = readFile(testFileName);
    auto [decoder, coded, outBitPtr] = Init(limit, tableBits, trainFileName, msg);
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

#define TEST(name, ...)                                                               \
    static void Test##name(benchmark::State& state) { TestMain(state, __VA_ARGS__); } \
    BENCHMARK(Test##name);

TEST(Pred1FH10, 1, 10, "fast_ru.txt", "haier.txt")
TEST(Pred2FH10, 2, 10, "fast_ru.txt", "haier.txt")
TEST(Pred4FH10, 4, 10, "fast_ru.txt", "haier.txt")
TEST(Pred8FH10, 8, 10, "fast_ru.txt", "haier.txt")
TEST(Pred16FH10, 16, 10, "fast_ru.txt", "haier.txt")
TEST(Pred32FH10, 32, 10, "fast_ru.txt", "haier.txt")
TEST(Pred64FH10, 64, 10, "fast_ru.txt", "haier.txt")
TEST(Pred128FH10, 128, 10, "fast_ru.txt", "haier.txt")
TEST(Pred256FH10, 256, 10, "fast_ru.txt", "haier.txt")
TEST(Pred512FH10, 512, 10, "fast_ru.txt", "haier.txt")
TEST(Pred1024FH10, 1024, 10, "fast_ru.txt", "haier.txt")
TEST(Pred2048FH10, 2048, 10, "fast_ru.txt", "haier.txt")
TEST(Pred4096FH10, 4096, 10, "fast_ru.txt", "haier.txt")
TEST(Pred8192FH10, 8192, 10, "fast_ru.txt", "haier.txt")

TEST(Pred1FH11, 1, 11, "fast_ru.txt", "haier.txt")
TEST(Pred2FH11, 2, 11, "fast_ru.txt", "haier.txt")
TEST(Pred4FH11, 4, 11, "fast_ru.txt", "haier.txt")
TEST(Pred8FH11, 8, 11, "fast_ru.txt", "haier.txt")
TEST(Pred16FH11, 16, 11, "fast_ru.txt", "haier.txt")
TEST(Pred32FH11, 32, 11, "fast_ru.txt", "haier.txt")
TEST(Pred64FH11, 64, 11, "fast_ru.txt", "haier.txt")
TEST(Pred128FH11, 128, 11, "fast_ru.txt", "haier.txt")
TEST(Pred256FH11, 256, 11, "fast_ru.txt", "haier.txt")
TEST(Pred512FH11, 512, 11, "fast_ru.txt", "haier.txt")
TEST(Pred1024FH11, 1024, 11, "fast_ru.txt", "haier.txt")
TEST(Pred2048FH11, 2048, 11, "fast_ru.txt", "haier.txt")
TEST(Pred4096FH11, 4096, 11, "fast_ru.txt", "haier.txt")
TEST(Pred8192FH11, 8192, 11, "fast_ru.txt", "haier.txt")

TEST(Pred1FH12, 1, 12, "fast_ru.txt", "haier.txt")
TEST(Pred2FH12, 2, 12, "fast_ru.txt", "haier.txt")
TEST(Pred4FH12, 4, 12, "fast_ru.txt", "haier.txt")
TEST(Pred8FH12, 8, 12, "fast_ru.txt", "haier.txt")
TEST(Pred16FH12, 16, 12, "fast_ru.txt", "haier.txt")
TEST(Pred32FH12, 32, 12, "fast_ru.txt", "haier.txt")
TEST(Pred64FH12, 64, 12, "fast_ru.txt", "haier.txt")
TEST(Pred128FH12, 128, 12, "fast_ru.txt", "haier.txt")
TEST(Pred256FH12, 256, 12, "fast_ru.txt", "haier.txt")
TEST(Pred512FH12, 512, 12, "fast_ru.txt", "haier.txt")
TEST(Pred1024FH12, 1024, 12, "fast_ru.txt", "haier.txt")
TEST(Pred2048FH12, 2048, 12, "fast_ru.txt", "haier.txt")
TEST(Pred4096FH12, 4096, 12, "fast_ru.txt", "haier.txt")
TEST(Pred8192FH12, 8192, 12, "fast_ru.txt", "haier.txt")

TEST(Pred1HF10, 1, 10, "haier.txt", "fast_ru.txt")
TEST(Pred2HF10, 2, 10, "haier.txt", "fast_ru.txt")
TEST(Pred4HF10, 4, 10, "haier.txt", "fast_ru.txt")
TEST(Pred8HF10, 8, 10, "haier.txt", "fast_ru.txt")
TEST(Pred16HF10, 16, 10, "haier.txt", "fast_ru.txt")
TEST(Pred32HF10, 32, 10, "haier.txt", "fast_ru.txt")
TEST(Pred64HF10, 64, 10, "haier.txt", "fast_ru.txt")
TEST(Pred128HF10, 128, 10, "haier.txt", "fast_ru.txt")
TEST(Pred256HF10, 256, 10, "haier.txt", "fast_ru.txt")
TEST(Pred512HF10, 512, 10, "haier.txt", "fast_ru.txt")
TEST(Pred1024HF10, 1024, 10, "haier.txt", "fast_ru.txt")
TEST(Pred2048HF10, 2048, 10, "haier.txt", "fast_ru.txt")
TEST(Pred4096HF10, 4096, 10, "haier.txt", "fast_ru.txt")
TEST(Pred8192HF10, 8192, 10, "haier.txt", "fast_ru.txt")

TEST(Pred1HF11, 1, 11, "haier.txt", "fast_ru.txt")
TEST(Pred2HF11, 2, 11, "haier.txt", "fast_ru.txt")
TEST(Pred4HF11, 4, 11, "haier.txt", "fast_ru.txt")
TEST(Pred8HF11, 8, 11, "haier.txt", "fast_ru.txt")
TEST(Pred16HF11, 16, 11, "haier.txt", "fast_ru.txt")
TEST(Pred32HF11, 32, 11, "haier.txt", "fast_ru.txt")
TEST(Pred64HF11, 64, 11, "haier.txt", "fast_ru.txt")
TEST(Pred128HF11, 128, 11, "haier.txt", "fast_ru.txt")
TEST(Pred256HF11, 256, 11, "haier.txt", "fast_ru.txt")
TEST(Pred512HF11, 512, 11, "haier.txt", "fast_ru.txt")
TEST(Pred1024HF11, 1024, 11, "haier.txt", "fast_ru.txt")
TEST(Pred2048HF11, 2048, 11, "haier.txt", "fast_ru.txt")
TEST(Pred4096HF11, 4096, 11, "haier.txt", "fast_ru.txt")
TEST(Pred8192HF11, 8192, 11, "haier.txt", "fast_ru.txt")

TEST(Pred1HF12, 1, 12, "haier.txt", "fast_ru.txt")
TEST(Pred2HF12, 2, 12, "haier.txt", "fast_ru.txt")
TEST(Pred4HF12, 4, 12, "haier.txt", "fast_ru.txt")
TEST(Pred8HF12, 8, 12, "haier.txt", "fast_ru.txt")
TEST(Pred16HF12, 16, 12, "haier.txt", "fast_ru.txt")
TEST(Pred32HF12, 32, 12, "haier.txt", "fast_ru.txt")
TEST(Pred64HF12, 64, 12, "haier.txt", "fast_ru.txt")
TEST(Pred128HF12, 128, 12, "haier.txt", "fast_ru.txt")
TEST(Pred256HF12, 256, 12, "haier.txt", "fast_ru.txt")
TEST(Pred512HF12, 512, 12, "haier.txt", "fast_ru.txt")
TEST(Pred1024HF12, 1024, 12, "haier.txt", "fast_ru.txt")
TEST(Pred2048HF12, 2048, 12, "haier.txt", "fast_ru.txt")
TEST(Pred4096HF12, 4096, 12, "haier.txt", "fast_ru.txt")
TEST(Pred8192HF12, 8192, 12, "haier.txt", "fast_ru.txt")

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

int main(int argc, char** argv) {
    benchmark::Initialize(&argc, argv);
    benchmark::SetDefaultTimeUnit(benchmark::kSecond);

    // Force each benchmark to run for 2 seconds
    char min_time[] = "--benchmark_min_time=1s";
    char* new_argv[] = {argv[0], min_time};
    int new_argc = 2;
    benchmark::Initialize(&new_argc, new_argv);

    CustomReporter reporter;
    benchmark::RunSpecifiedBenchmarks(&reporter);
    benchmark::Shutdown();
    return 0;
}

int kek(const std::vector<int>& a, const std::vector<int>& b) {
    auto na = std::ssize(a);
    auto nb = std::ssize(b);
}

int main1() {
    Debug(__LINE__);
    const auto msg = readFile("text.txt");
    Debug(__LINE__);
    auto [decoder, coded, outBitPtr] = Init({}, {}, "haier.txt", msg);
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
