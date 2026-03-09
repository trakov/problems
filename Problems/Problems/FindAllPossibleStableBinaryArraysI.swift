final class FindAllPossibleStableBinaryArraysI {
    func numberOfStableArrays(_ zero: Int, _ one: Int, _ limit: Int) -> Int {
        let MOD = 1_000_000_007
        var dp = Array(
            repeating: Array(repeating: [0, 0], count: one+1), count: zero+1
        )
        for i in 0...min(zero, limit) {
            dp[i][0][0] = 1
        }
        for j in 0...min(one, limit) {
            dp[0][j][1] = 1
        }
        for i in 1...zero {
            for j in 1...one {
                if i > limit {
                    dp[i][j][0] =
                    dp[i - 1][j][0] +
                    dp[i - 1][j][1] -
                    dp[i - limit - 1][j][1]
                } else {
                    dp[i][j][0] = dp[i - 1][j][0] + dp[i - 1][j][1]
                }
                dp[i][j][0] = ((dp[i][j][0] % MOD) + MOD) % MOD
                if (j > limit) {
                    dp[i][j][1] =
                    dp[i][j - 1][1] +
                    dp[i][j - 1][0] -
                    dp[i][j - limit - 1][0]
                } else {
                    dp[i][j][1] = dp[i][j - 1][1] + dp[i][j - 1][0]
                }
                dp[i][j][1] = ((dp[i][j][1] % MOD) + MOD) % MOD
            }
        }
        return ((dp[zero][one][0] + dp[zero][one][1]) % MOD)
    }
    
    func tests() {
        print(numberOfStableArrays(1, 1, 2)) // 2
        print(numberOfStableArrays(1, 2, 1)) // 1
        print(numberOfStableArrays(3, 3, 2)) // 14
    }
}
