final class MinimumXORPathinaGrid {
    func minCost(_ grid: [[Int]]) -> Int {
        let n = grid[0].count
        var dp = Array(repeating: Array(repeating: false, count: 1024), count: n)
        var next = Array(repeating: false, count: 1024)
        dp[0][grid[0][0]] = true
        for (i, row) in grid.enumerated() {
            for (j, val) in row.enumerated() where i > 0 || j > 0 {
                next = Array(repeating: false, count: 1024)
                for k in 0..<1024 {
                    if dp[j][k] || (j > 0 && dp[j - 1][k]) {
                        next[k ^ val] = true
                    }
                }
                dp[j] = next
            }
        }
        for k in 0..<1024 where dp.last![k] {
            return k
        }
        return -1
    }
    
    func tests() {
        print(minCost([[1,2],[3,4]])) // 6
        print(minCost([[6,7],[5,8]])) // 9
        print(minCost([[2,7,5]])) // 0
    }
}
