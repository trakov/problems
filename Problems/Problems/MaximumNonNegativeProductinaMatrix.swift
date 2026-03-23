final class MaximumNonNegativeProductinaMatrix {
    func maxProductPath(_ grid: [[Int]]) -> Int {
        let MOD = 1_000_000_007
        let m = grid.count
        let n = grid[0].count
        var maxgt = grid
        var minlt = grid
        if n > 1 {
            for i in 1..<n {
                maxgt[0][i] = maxgt[0][i - 1] * grid[0][i]
                minlt[0][i] = maxgt[0][i - 1] * grid[0][i]
            }
        }
        if m > 1 {
            for i in 1..<m {
                maxgt[i][0] = maxgt[i - 1][0] * grid[i][0]
                minlt[i][0] = maxgt[i - 1][0] * grid[i][0]
            }
        }
        if n > 1, m > 1 {
            for i in 1..<m {
                for j in 1..<n {
                    if grid[i][j] >= 0 {
                        maxgt[i][j] = max(maxgt[i][j - 1], maxgt[i - 1][j]) * grid[i][j]
                        minlt[i][j] = min(minlt[i][j - 1], minlt[i - 1][j]) * grid[i][j]
                    } else {
                        maxgt[i][j] = min(minlt[i][j - 1], minlt[i - 1][j]) * grid[i][j]
                        minlt[i][j] = max(maxgt[i][j - 1], maxgt[i - 1][j]) * grid[i][j]
                    }
                }
            }
        }
        if maxgt[m - 1][n - 1] < 0 {
            return -1
        } else {
            return maxgt[m - 1][n - 1] % MOD
        }
    }
    
    func tests() {
        print(maxProductPath([[-1,-2,-3],[-2,-3,-3],[-3,-3,-2]])) // -1
        print(maxProductPath([[1,-2,1],[1,-2,1],[3,-4,1]])) // 8
        print(maxProductPath([[1,3],[0,-4]])) // 0
    }
}
