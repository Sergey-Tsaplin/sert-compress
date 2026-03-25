#include "huffman.h"
#include "utils.h"

#include <benchmark/benchmark.h>

#include <fstream>
#include <memory>
#include <cassert>
#include <vector>

std::string readFile(const std::string& name) {
    std::string text, line;
    std::ifstream fi("../../coder/data/" + name);
    while (getline(fi, line)) {
        text += line + "\n";
    }
    fi.close();
    return text;
}

static auto Init(bool usePred, const std::string& trainFileName, const std::string& msg) {
    std::vector<uint64_t> stat(NDecoder::CHAR_SIZE, 0);
    std::vector<std::vector<uint64_t>> statTable(NDecoder::CHAR_SIZE, std::vector<uint64_t>(NDecoder::CHAR_SIZE, 0));

    uint8_t prev = 0;
    for (uint8_t ch : readFile(trainFileName)) {
        stat[ch]++;
        statTable[prev][ch]++;
        prev = ch;
    }

    std::unique_ptr<IDecoder> decoder;
    if (usePred) {
        decoder = std::make_unique<NDecoder::TPredHuffDecoder>(statTable);
    } else {
        decoder = std::make_unique<NDecoder::THuffDecoder>(stat);
    }

    auto [coded, bitSize] = decoder->Write(msg);
    return std::make_tuple(std::move(decoder), std::move(coded), bitSize);
}

static void TestMain(benchmark::State& state, bool usePred, const std::string& trainFileName, const std::string& testFileName) {
    const auto msg = readFile(testFileName);
    auto [decoder, coded, outBitPtr] = Init(usePred, trainFileName, msg);
    // std::cout << trainFileName << " MAX_LEN = " << decoder->GetMaxLen() << std::endl;
    for (auto _ : state) {
        decoder->Reset();
        size_t inBitPtr = 0;
        TString restored;
        while (inBitPtr < outBitPtr) {
            restored.push_back(static_cast<char>(decoder->GetNext(coded, inBitPtr)));
        }

        if (msg != restored) {
            auto oldLen = static_cast<double>(msg.size());
            auto newLen = (outBitPtr + 7) / 8;
            Debug("Fail:", msg.size(), "->", newLen, (oldLen - static_cast<double>(newLen)) / oldLen * 1e2, "%");
            Debug(msg.size(), restored.size());
            // Debug(msg, restored);
            exit(1);
        }
    }
    state.SetItemsProcessed(state.iterations() * std::ssize(msg));
}

// static void Test0(benchmark::State& state) { TestMain(state, true, "text.txt", "text.txt"); }
static void Test1(benchmark::State& state) { TestMain(state, true, "fast_ru.txt", "haier.txt"); }
static void Test2(benchmark::State& state) { TestMain(state, false, "fast_ru.txt", "haier.txt"); }
static void Test3(benchmark::State& state) { TestMain(state, true, "haier.txt", "fast_ru.txt"); }
static void Test4(benchmark::State& state) { TestMain(state, false, "haier.txt", "fast_ru.txt"); }

// BENCHMARK(Test0);
BENCHMARK(Test1);
BENCHMARK(Test2);
BENCHMARK(Test3);
BENCHMARK(Test4);
BENCHMARK(Test1);
BENCHMARK(Test2);
BENCHMARK(Test3);
BENCHMARK(Test4);

BENCHMARK_MAIN();

int main1() {
    Debug(__LINE__);
    const auto msg = readFile("text.txt");
    Debug(__LINE__);
    auto [decoder, coded, outBitPtr] = Init(true, "text.txt", msg);
    Debug(__LINE__, coded.size(), outBitPtr);
    // std::cout << trainFileName << " MAX_LEN = " << decoder->GetMaxLen() << std::endl;

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
}
