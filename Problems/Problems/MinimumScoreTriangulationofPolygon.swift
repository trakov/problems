final class MinimumScoreTriangulationofPolygon {
    func minScoreTriangulation(_ values: [Int]) -> Int {
        let n = values.count
        var memo: [Int: Int] = [:]
        func dp(_ i: Int, _ j: Int) -> Int {
            if i + 2 > j { return 0 }
            if i + 2 == j { return values[i] * values[i + 1] * values[j] }
            let key = i * n + j
            if memo[key] == nil {
                var minScore = Int.max
                for k in i+1..<j {
                    minScore = min(
                        minScore,
                        values[i] * values[k] * values[j] + dp(i, k) + dp(k, j)
                    )
                }
                memo[key] = minScore
            }
            return memo[key]!
        }
        return dp(0, n - 1)
    }

    func tests() {
        print(minScoreTriangulation([1, 2, 3])) // 6
        print(minScoreTriangulation([3, 7, 4, 5])) // 144
    }
}
