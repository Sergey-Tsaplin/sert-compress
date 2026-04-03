#pragma once
#include <array>
#include <cstdint>
#include <iostream>
#include <vector>

static constexpr size_t CHAR_SIZE = 256;

using TStat = std::array<uint64_t, CHAR_SIZE>;

static constexpr std::array<uint32_t, 3> AND_MASKS = {0xFFFFu, 0xFFu, 0u};

static constexpr int kDebugLevel = 1;

namespace NPrivate {

template <typename T>
concept CVector =
    requires(T t) { requires std::is_same_v<T, std::vector<typename T::value_type, typename T::allocator_type>>; };

template <typename T>
inline void PrintVector(const std::vector<T>& v) {
    std::cout << "{";
    for (size_t i = 0; i < v.size(); i++) {
        std::cout << v[i] << " }"[i + 1 == v.size()];
    }
}

}  // namespace NPrivate

template <typename... TArgs>
inline void Debug(const TArgs&... args) {
    if (kDebugLevel < 0) {
        return;
    }
    auto print = [](auto args) {
        if constexpr (NPrivate::CVector<decltype(args)>) {
            NPrivate::PrintVector(args);
        } else {
            std::cout << args;
        }
    };
    ((print(args), std::cout << " "), ...);
    std::cout << std::endl;
}
