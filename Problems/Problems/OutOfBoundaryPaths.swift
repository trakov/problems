class OutOfBoundaryPaths {
    func findPaths(_ m: Int, _ n: Int, _ maxMove: Int, _ x: Int, _ y: Int) -> Int {
        guard maxMove > 0 else { return 0 }
        var dp = Array(repeating: Array(repeating: 0, count: n), count: m)
        dp[x][y] = 1
        let mod = 1_000_000_007
        var result = 0
        for moves in 1...maxMove {
            var newDP = Array(repeating: Array(repeating: 0, count: n), count: m)
            for i in 0..<m {
                for j in 0..<n {
                    if i == m - 1 { result = (result + dp[i][j]) % mod }
                    if j == n - 1 { result = (result + dp[i][j]) % mod }
                    if i == 0 { result = (result + dp[i][j]) % mod }
                    if j == 0 { result = (result + dp[i][j]) % mod }
                    newDP[i][j] = (
                        ((i > 0 ? dp[i - 1][j] : 0) + (i < m - 1 ? dp[i + 1][j] : 0)) +
                        ((j > 0 ? dp[i][j - 1] : 0) + (j < n - 1 ? dp[i][j + 1] : 0))
                    ) % mod
                }
            }
            dp = newDP
        }
        return result
    }
    
    func bruteForce(_ m: Int, _ n: Int, _ maxMove: Int, _ i: Int, _ j: Int) -> Int {
        if i == m || j == n || i < 0 || j < 0 {
            return 1
        }
        if maxMove == 0 { return 0 }
        return bruteForce(m, n, maxMove - 1, i - 1, j) +
        bruteForce(m, n, maxMove - 1, i + 1, j) +
        bruteForce(m, n, maxMove - 1, i, j - 1) +
        bruteForce(m, n, maxMove - 1, i, j + 1)
    }
    
    func tests() {
        print(findPaths(2, 2, 2, 0, 0)) // 6
        print(findPaths(1, 3, 3, 0, 1)) // 12
    }
}

