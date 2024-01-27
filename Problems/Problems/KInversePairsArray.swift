class KInversePairsArray {
    func kInversePairs(_ n: Int, _ k: Int) -> Int {
        let mod = 1_000_000_007
        var dp = Array(repeating: Array(repeating: 0, count: k + 1), count: n + 1)
        for i in 1...n {
            for j in 0...k {
                if j == 0 {
                    dp[i][j] = 1
                } else {
                    let val = (dp[i - 1][j] + mod - (j - i >= 0 ? dp[i - 1][j - i] : 0)) % mod
                    dp[i][j] = (dp[i][j - 1] + val) % mod
                }
            }
        }
        return (dp[n][k] + mod - (k > 0 ? dp[n][k - 1] : 0)) % mod
    }
    
    func tests() {
        print(kInversePairs(3, 0)) // 1
        print(kInversePairs(3, 1)) // 2
    }
}

