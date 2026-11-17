final class MinimumChangestoMakeKSemipalindromes {
    func minimumChanges(_ s: String, _ k: Int) -> Int {
        let n = s.count
        let ch = Array(s)
        var factors = Array(repeating: [Int](), count: n + 1)
        for d in 1...(n / 2) {
            var m = d * 2
            while m <= n {
                factors[m].append(d)
                m += d
            }
        }
        func segmentCost(_ l: Int, _ m: Int) -> Int {
            var best = m
            for d in factors[m] {
                let groups = m / d
                var changes = 0
                for offset in 0..<d {
                    for t in 0..<(groups / 2) {
                        if ch[l + offset + t * d] != ch[l + offset + (groups - 1 - t) * d] {
                            changes += 1
                        }
                    }
                }
                best = min(best, changes)
            }
            return best
        }
        var cost = Array(repeating: Array(repeating: 0, count: n), count: n)
        if n >= 2 {
            for l in 0..<(n - 1) {
                for r in (l + 1)..<n {
                    cost[l][r] = segmentCost(l, r - l + 1)
                }
            }
        }
        var prev = Array(repeating: 0, count: n)
        for start in 0..<n {
            prev[start] = cost[start][n - 1]
        }
        if k >= 2 {
            for seg in 2...k {
                var cur = Array(repeating: n, count: n)
                let limit = n - 1 - 2 * (seg - 1)
                for start in 0..<(n - 2 * seg + 1) {
                    guard start <= limit else { break }
                    for e in (start + 1)...limit {
                        cur[start] = min(cur[start], cost[start][e] + prev[e + 1])
                    }
                }
                prev = cur
            }
        }
        return prev[0]
    }

    func tests() {
        print(minimumChanges("abcac", 2)) // 1
        print(minimumChanges("abcdef", 2)) // 2
        print(minimumChanges("aabbaa", 3)) // 0
    }
}
