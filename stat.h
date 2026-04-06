#pragma once

#include "utils.h"

#include <array>
#include <cstdint>
#include <optional>
#include <string_view>
#include <unordered_map>

namespace NStat {

struct TPredStat {
    std::array<uint8_t, CHAR_SIZE * CHAR_SIZE> ClusterID;
    std::vector<TStat> ClusterStat;
};

TPredStat GetClusteredStat(std::string_view data, size_t count);

std::unordered_map<uint32_t, TStat> GetTopPredicates(std::string_view data, std::optional<size_t> limit = {});

}  // namespace NStat
