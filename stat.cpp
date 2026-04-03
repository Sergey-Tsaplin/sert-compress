#include "stat.h"

#include <algorithm>
#include <cstdint>
#include <optional>
#include <ranges>
#include <string_view>
#include <unordered_map>
#include <vector>

namespace NStat {

std::unordered_map<uint32_t, TStat> GetTopPredicates(std::string_view data, std::optional<size_t> limit) {
    std::unordered_map<uint32_t, uint32_t> mp;
    uint32_t cur = 0;
    for (char ch : data) {
        cur = ((cur << 8) | static_cast<uint8_t>(ch));
        for (auto and_mask : AND_MASKS) {
            mp[cur & and_mask]++;
        }
    }

    std::vector<std::pair<uint32_t, uint32_t>> predicates(mp.begin(), mp.end());
    std::ranges::sort(predicates, std::greater(), &std::pair<uint32_t, uint32_t>::second);
    predicates.resize(std::min(limit.value_or(predicates.size()), predicates.size()));

    std::unordered_map<uint32_t, TStat> statMap;
    for (const auto& pred : predicates | std::views::keys) {
        statMap[pred] = {};
    }

    cur = 0;
    for (size_t i = 0; i + 1 < data.size(); i++) {
        cur = ((cur << 8) | static_cast<uint8_t>(data[i]));
        const auto next = static_cast<uint8_t>(data[i + 1]);
        for (uint32_t mask : AND_MASKS) {
            if (auto it = statMap.find(cur & mask); it != statMap.end()) {
                TStat& stat = it->second;
                stat[next]++;
            }
        }
    }

    return statMap;
}

}  // namespace NStat
