#pragma once

#include "utils.h"

#include <array>
#include <cstdint>
#include <optional>
#include <string_view>
#include <unordered_map>

namespace NStat {

std::unordered_map<uint32_t, TStat> GetTopPredicates(std::string_view data, std::optional<size_t> limit = {});

}  // namespace NStat
