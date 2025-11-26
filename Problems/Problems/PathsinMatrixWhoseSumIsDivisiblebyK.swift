final class PathsinMatrixWhoseSumIsDivisiblebyK {
    func numberOfPaths(_ grid: [[Int]], _ k: Int) -> Int {
        let mod = 1_000_000_007
        let (m, n) = (grid.count, grid[0].count)
        var dp = Array(repeating: Array(repeating: Array(repeating: 0, count: k), count: n+1), count: m+1)
        for i in 1...m {
            for j in 1...n {
                if i == 1 && j == 1 {
                    dp[i][j][grid[0][0] % k] = 1
                    continue
                }
                let value = grid[i - 1][j - 1] % k
                for r in 0..<k {
                    let prevMod = (r - value + k) % k
                    dp[i][j][r] = (dp[i - 1][j][prevMod] + dp[i][j - 1][prevMod]) % mod
                }
            }
        }
        return dp[m][n][0]
    }
    
    func tests() {
        print(numberOfPaths([[5,2,4],[3,0,5],[0,7,2]], 3)) // 2
        print(numberOfPaths([[0,0]], 5)) // 1
        print(numberOfPaths([[7,3,4,9],[2,3,6,2],[2,3,7,0]], 1)) // 10
    }
}
