#include "stat.h"

#include "utils.h"

#include <algorithm>
#include <array>
#include <cmath>
#include <iomanip>
#include <limits>
#include <random>
#include <ranges>
#include <string_view>
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

// L1 distance between two normalized distributions
static double StatDistance(const TStat& a, const TStat& b) {
    uint64_t sumA = 0, sumB = 0;
    for (size_t i = 0; i < CHAR_SIZE; i++) {
        sumA += a[i];
        sumB += b[i];
    }
    if (sumA == 0 && sumB == 0) {
        return 0.0;
    }
    if (sumA == 0 || sumB == 0) {
        return 1.0;
    }

    double dist = 0.0;
    for (size_t i = 0; i < CHAR_SIZE; i++) {
        double pa = static_cast<double>(a[i]) / sumA;
        double pb = static_cast<double>(b[i]) / sumB;
        dist += std::abs(pa - pb);
    }
    return dist;
}

static double HellingerDistance(const TStat& a, const TStat& b) {
    uint64_t sumA = 0, sumB = 0;
    for (size_t i = 0; i < CHAR_SIZE; i++) {
        sumA += a[i];
        sumB += b[i];
    }
    if (sumA == 0 && sumB == 0) {
        return 0.0;
    }
    if (sumA == 0 || sumB == 0) {
        return 1.0;
    }

    double sum = 0.0;
    for (size_t i = 0; i < CHAR_SIZE; i++) {
        double pa = static_cast<double>(a[i]) / sumA;
        double pb = static_cast<double>(b[i]) / sumB;
        double diff = std::sqrt(pa) - std::sqrt(pb);
        sum += diff * diff;
    }
    return std::sqrt(sum) * (1.0 / std::numbers::sqrt2);  // range [0, 1]
}

static double ChiSquaredDistance(const TStat& a, const TStat& b) {
    uint64_t sumA = 0, sumB = 0;
    for (size_t i = 0; i < CHAR_SIZE; i++) {
        sumA += a[i];
        sumB += b[i];
    }
    if (sumA == 0 && sumB == 0) {
        return 0.0;
    }
    if (sumA == 0 || sumB == 0) {
        return 1.0;
    }

    double dist = 0.0;
    for (size_t i = 0; i < CHAR_SIZE; i++) {
        double pa = static_cast<double>(a[i]) / sumA;
        double pb = static_cast<double>(b[i]) / sumB;
        double denom = pa + pb;
        if (denom == 0.0) {
            continue;
        }
        double diff = pa - pb;
        dist += (diff * diff) / denom;
    }
    return dist;  // range [0, 2]
}

static double CosineDistance(const TStat& a, const TStat& b) {
    uint64_t dotAB = 0, dotAA = 0, dotBB = 0;
    for (size_t i = 0; i < CHAR_SIZE; i++) {
        dotAB += a[i] * b[i];
        dotAA += a[i] * a[i];
        dotBB += b[i] * b[i];
    }
    if (dotAA == 0 && dotBB == 0) {
        return 0.0;
    }
    if (dotAA == 0 || dotBB == 0) {
        return 1.0;
    }

    double similarity =
        static_cast<double>(dotAB) / (std::sqrt(static_cast<double>(dotAA)) * std::sqrt(static_cast<double>(dotBB)));
    return 1.0 - similarity;  // range [0, 1]
}

TPredStat GetClusteredStat1(std::string_view data, uint8_t count) {
    double distanceThreshold = static_cast<double>(count) / 256.0;
    // ---- Collect stats ------------------------------------------------------
    std::vector<TStat> stats(CHAR_SIZE * CHAR_SIZE);
    for (auto& s : stats) {
        s.fill(0);
    }

    uint16_t predicate = 0;
    for (char ch : data) {
        uint16_t cur = static_cast<uint8_t>(ch);
        for (uint16_t msk : {0xFFFFu, 0xFFu, 0u}) {
            stats[predicate & msk][cur]++;
        }
        predicate = static_cast<uint16_t>((predicate << 8u) | cur);
    }

    // ---- Separate active predicates -----------------------------------------
    // Inactive ones (never seen) will map to the cluster of predicate 0
    // which accumulates stats with mask=0 (global fallback)
    std::vector<uint16_t> active;
    for (size_t i = 0; i < CHAR_SIZE * CHAR_SIZE; i++) {
        uint64_t total = 0;
        for (auto v : stats[i]) {
            total += v;
        }
        if (total > 0) {
            active.push_back(static_cast<uint16_t>(i));
        }
    }

    const size_t N = active.size();

    // ---- Build initial distance matrix --------------------------------------
    // dist[i][j] = Hellinger distance between active[i] and active[j]
    std::vector<std::vector<double>> dist(N, std::vector<double>(N, 0.0));
    for (size_t i = 0; i < N; i++) {
        for (size_t j = i + 1; j < N; j++) {
            dist[i][j] = dist[j][i] = ChiSquaredDistance(stats[active[i]], stats[active[j]]);
        }
    }

    // ---- Cluster state ------------------------------------------------------
    // Each active predicate starts as its own cluster
    // clusterMembers[i] = list of indices into `active` belonging to cluster i
    std::vector<std::vector<size_t>> members(N);
    for (size_t i = 0; i < N; i++) {
        members[i] = {i};
    }

    // clusterDist[i][j] = average-linkage distance between clusters i and j
    // We reuse `dist` matrix in-place, updating rows/cols as we merge
    std::vector<bool> alive(N, true);

    // Merge history: (mergedIntoI, absorbedJ, distAtMerge)
    struct TMerge {
        size_t I, J;
        double Dist;
    };
    std::vector<TMerge> mergeHistory;
    mergeHistory.reserve(N - 1);

    // ---- Agglomerative loop (average linkage) --------------------------------
    for (size_t iter = 0; iter + 1 < N; iter++) {
        // Find closest pair of alive clusters
        double bestDist = std::numeric_limits<double>::max();
        size_t bi = 0, bj = 0;
        for (size_t i = 0; i < N; i++) {
            if (!alive[i]) {
                continue;
            }
            for (size_t j = i + 1; j < N; j++) {
                if (!alive[j]) {
                    continue;
                }
                if (dist[i][j] < bestDist) {
                    bestDist = dist[i][j];
                    bi = i;
                    bj = j;
                }
            }
        }

        // Early exit: if the closest pair is already beyond threshold,
        // no more merges will be within threshold either
        if (bestDist > distanceThreshold) {
            break;
        }

        mergeHistory.push_back({bi, bj, bestDist});

        // Merge bj into bi (average linkage update)
        const double sizeI = static_cast<double>(members[bi].size());
        const double sizeJ = static_cast<double>(members[bj].size());
        const double total = sizeI + sizeJ;

        for (size_t k = 0; k < N; k++) {
            if (!alive[k] || k == bi || k == bj) {
                continue;
            }
            // Weighted average: preserves average-linkage property
            dist[bi][k] = dist[k][bi] = (dist[bi][k] * sizeI + dist[bj][k] * sizeJ) / total;
        }

        // Move members
        for (size_t m : members[bj]) {
            members[bi].push_back(m);
        }
        members[bj].clear();
        alive[bj] = false;
    }

    // ---- Assign cluster IDs -------------------------------------------------
    // Surviving alive clusters become final clusters
    std::vector<size_t> activeClusterIdx;  // indices into cluster arrays
    for (size_t i = 0; i < N; i++) {
        if (alive[i]) {
            activeClusterIdx.push_back(i);
        }
    }

    const size_t K = activeClusterIdx.size();

    TPredStat result;
    result.ClusterID.fill(0);
    result.ClusterStat.resize(K);
    for (auto& cs : result.ClusterStat) {
        cs.fill(0);
    }

    for (size_t ci = 0; ci < K; ci++) {
        size_t clusterIdx = activeClusterIdx[ci];
        for (size_t memberIdx : members[clusterIdx]) {
            uint16_t pred = active[memberIdx];
            result.ClusterID[pred] = static_cast<uint8_t>(ci);

            // Accumulate stats into cluster stat
            for (size_t c = 0; c < CHAR_SIZE; c++) {
                result.ClusterStat[ci][c] += stats[pred][c];
            }
        }
    }

    // ---- Inactive predicates -> nearest cluster -----------------------------
    // predicates that were never seen get assigned to closest cluster centroid
    for (size_t pred = 0; pred < CHAR_SIZE * CHAR_SIZE; pred++) {
        uint64_t total = 0;
        for (auto v : stats[pred]) {
            total += v;
        }
        if (total > 0) {
            continue;  // already handled
        }

        // Find nearest cluster by Hellinger to cluster aggregate stat
        double bestD = std::numeric_limits<double>::max();
        uint8_t bestCI = 0;
        for (size_t ci = 0; ci < K; ci++) {
            double d = HellingerDistance(stats[pred], result.ClusterStat[ci]);
            if (d < bestD) {
                bestD = d;
                bestCI = static_cast<uint8_t>(ci);
            }
        }
        result.ClusterID[pred] = bestCI;
    }

    // std::vector<double> sums;
    // sums.reserve(result.ClusterStat.size());
    // for (const auto& stat : result.ClusterStat) {
    //     sums.push_back(static_cast<double>(std::accumulate(stat.begin(), stat.end(), 0UL))
    //                    / static_cast<double>(data.size()) * 1e2);
    // }
    // std::ranges::sort(sums, std::greater());
    // auto c1 = std::ranges::count_if(sums, [](double x) { return x < 0.001; });
    // auto c2 = std::ranges::count_if(sums, [](double x) { return x < 0.002; });
    // auto c3 = std::ranges::count_if(sums, [](double x) { return x < 0.004; });

    // std::cerr << "Size: " << result.ClusterStat.size() << " " << c1 << " " << c2 << " " << c3 << "\n";
    // for (size_t i = 0; i < sums.size(); i = i * 2 + 1) {
    //     std::cerr << i << ": " << std::setprecision(3) << std::fixed << sums[i] << ", ";
    // }
    // std::cerr << std::endl;

    // std::vector<std::string> dbg(result.ClusterStat.size(), "");
    // for (size_t i = 0; i < 0xFFFF; i++) {
    //     size_t c1 = i >> 8;
    //     size_t c2 = i & 0xFF;
    //     if (32 <= c1 && c1 <= 128 && 32 <= c2 && c2 <= 128) {
    //         dbg[result.ClusterID[i]] += std::string{char(c1), char(c2), ' '};
    //     }
    // }

    // std::cout << std::setprecision(3) << std::fixed;
    // for (size_t i = 0; i < result.ClusterStat.size(); i++) {
    //     const auto& stat = result.ClusterStat[i];
    //     double perc = static_cast<double>(std::accumulate(stat.begin(), stat.end(), 0UL)) /
    //     static_cast<double>(data.size()) * 1e2; std::cout << i << " " << perc << "% " << dbg[i].size() / 3 << ": " <<
    //     dbg[i] << "\n";
    // }

    return result;
}

TPredStat GetClusteredStat(std::string_view data, size_t count) {
    // ---- Collect stats ------------------------------------------------
    std::vector<TStat> stats(CHAR_SIZE * CHAR_SIZE);
    for (auto& s : stats) {
        s.fill(0);
    }

    uint16_t predicate = 0;
    for (char ch : data) {
        uint16_t cur = static_cast<uint8_t>(ch);
        stats[predicate][cur]++;
        // also accumulate into single-byte and zero predicates
        stats[predicate & 0xFFu][cur]++;
        stats[0][cur]++;
        predicate = static_cast<uint16_t>((predicate << 8u) | cur);
    }

    // ---- Separate "empty" predicates (never seen) ----------------------
    // They'll all go to cluster 0 (the fallback cluster)
    const size_t N = stats.size();

    // Indices of non-empty predicates
    std::vector<uint16_t> active;
    active.reserve(N);
    for (size_t i = 0; i < N; i++) {
        uint64_t total = 0;
        for (auto v : stats[i]) {
            total += v;
        }
        if (total > 0) {
            active.push_back(static_cast<uint16_t>(i));
        }
    }

    std::cout << "Non empty clusters: " << active.size() << " count=" << int(count) << std::endl;

    // ---- K-Means++ initialisation -------------------------------------
    const size_t K = count;
    std::vector<size_t> centroids;  // indices into `active`
    centroids.reserve(K);

    std::mt19937_64 rng(42);

    if (active.empty()) {
        // Edge case: no data
        TPredStat result;
        result.ClusterID.fill(0);
        result.ClusterStat.resize(1);
        result.ClusterStat[0].fill(0);
        return result;
    }

    // Pick first centroid randomly
    {
        std::uniform_int_distribution<size_t> dist(0, active.size() - 1);
        centroids.push_back(dist(rng));
    }

    std::vector<double> minDist(active.size(), std::numeric_limits<double>::max());

    for (size_t k = 1; k < K && k <= active.size(); k++) {
        // Update min distances to nearest centroid
        for (size_t i = 0; i < active.size(); i++) {
            double d = CosineDistance(stats[active[i]], stats[active[centroids.back()]]);
            if (d < minDist[i]) {
                minDist[i] = d;
            }
        }
        // Sample proportional to distance^2
        double total = 0.0;
        for (double d : minDist) {
            total += d * d;
        }

        std::uniform_real_distribution<double> udist(0.0, total);
        double threshold = udist(rng);
        double cumulative = 0.0;
        size_t chosen = 0;
        for (size_t i = 0; i < active.size(); i++) {
            cumulative += minDist[i] * minDist[i];
            if (cumulative >= threshold) {
                chosen = i;
                break;
            }
        }
        centroids.push_back(chosen);
    }

    const size_t actualK = centroids.size();

    // Centroid stats (as doubles for recomputation)
    std::vector<TStat> centroidStats(actualK);
    for (size_t k = 0; k < actualK; k++) {
        centroidStats[k] = stats[active[centroids[k]]];
    }

    // ---- K-Means iterations -------------------------------------------
    std::vector<size_t> assignment(active.size(), 0);
    const int MAX_ITER = 50;

    for (int iter = 0; iter < MAX_ITER; iter++) {
        bool changed = false;

        // Assignment step
        for (size_t i = 0; i < active.size(); i++) {
            double bestDist = std::numeric_limits<double>::max();
            size_t bestK = 0;
            for (size_t k = 0; k < actualK; k++) {
                double d = ChiSquaredDistance(stats[active[i]], centroidStats[k]);
                if (d < bestDist) {
                    bestDist = d;
                    bestK = k;
                }
            }
            if (assignment[i] != bestK) {
                assignment[i] = bestK;
                changed = true;
            }
        }

        if (!changed) {
            break;
        }

        // Update step: recompute centroids as sum (we compare normalized anyway)
        for (auto& cs : centroidStats) {
            cs.fill(0);
        }
        std::vector<size_t> clusterSize(actualK, 0);

        for (size_t i = 0; i < active.size(); i++) {
            size_t k = assignment[i];
            clusterSize[k]++;
            for (size_t c = 0; c < CHAR_SIZE; c++) {
                centroidStats[k][c] += stats[active[i]][c];
            }
        }
    }

    // ---- Build result -------------------------------------------------
    TPredStat result;
    result.ClusterStat.resize(actualK);
    result.ClusterID.fill(0);  // empty predicates -> cluster 0

    for (size_t k = 0; k < actualK; k++) {
        result.ClusterStat[k] = centroidStats[k];
    }

    for (size_t i = 0; i < active.size(); i++) {
        result.ClusterID[active[i]] = static_cast<uint8_t>(assignment[i]);
    }

    return result;
}

}  // namespace NStat
