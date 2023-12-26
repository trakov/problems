class NumberOfDiceRollsWithTargetSum {
    func numRollsToTarget(_ n: Int, _ k: Int, _ target: Int) -> Int {
        guard n * k >= target else { return 0 }
        let mod = 1_000_000_007
        var dp = Array(repeating: Array(repeating: 0, count: target + 1), count: n + 1)
        dp[0][0] = 1
        for i in 1...n {
            for j in i...min(i * k, target) {
                for temp in 1...min(k, j) {
                    dp[i][j] = (dp[i][j] + dp[i - 1][j - temp]) % mod
                }
            }
        }
        return dp[n][target]
    }
    
    func tests() {
        print(numRollsToTarget(1, 6, 3)) // 1
        print(numRollsToTarget(2, 6, 7)) // 6
        print(numRollsToTarget(30, 30, 500)) // 222616187
    }
}

