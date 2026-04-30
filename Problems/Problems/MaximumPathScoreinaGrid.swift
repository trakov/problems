final class MaximumPathScoreinaGrid {
    func maxPathScore(_ grid: [[Int]], _ k: Int) -> Int {
        let (m, n) = (grid.count, grid[0].count)
        var dp = Array(
            repeating: Array(repeating: Array(repeating: Int.min, count: k+1), count: n), count: m
        )
        dp[0][0][0] = 0
        for i in 0..<m {
            for j in 0..<n {
                for c in 0...k where dp[i][j][c] != Int.min {
                    if i + 1 < m {
                        let val = grid[i + 1][j]
                        let cost = val == 0 ? 0 : 1
                        if c + cost <= k {
                            dp[i + 1][j][c + cost] = max(
                                dp[i + 1][j][c + cost],
                                dp[i][j][c] + val
                            )
                        }
                    }
                    if j + 1 < n {
                        let val = grid[i][j + 1]
                        let cost = val == 0 ? 0 : 1
                        if c + cost <= k {
                            dp[i][j + 1][c + cost] = max(
                                dp[i][j + 1][c + cost],
                                dp[i][j][c] + val
                            )
                        }
                    }
                }
            }
        }
        var result = Int.min
        for c in 0...k {
            result = max(result, dp[m - 1][n - 1][c])
        }
        return result < 0 ? -1 : result
    }
    
    func tests() {
        print(maxPathScore([[0, 1],[2, 0]], 1)) // 2
        print(maxPathScore([[0, 1],[1, 2]], 1)) // -1
    }
}
