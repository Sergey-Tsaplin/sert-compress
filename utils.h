#pragma once
#include <iostream>
#include <vector>

int DEBUG_LEVEL = 1;

namespace NPrivate {

    template <typename T> concept CVector = requires(T t) {
        requires std::is_same_v<T, std::vector<typename T::value_type, typename T::allocator_type>>;
    };

    template <typename T>
    inline void PrintVector(const std::vector<T>& v) {
        std::cout << "{";
        for (size_t i = 0; i < v.size(); i++) {
            std::cout << v[i] << " }"[i + 1 == v.size()];
        }
    }

} // namespace NPrivate

template <typename... TArgs>
inline void Debug(const TArgs&... args) {
    if (DEBUG_LEVEL < 0) return;
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
