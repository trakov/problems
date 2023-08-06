class NumberOfMusicPlaylists {
    func numMusicPlaylists(_ n: Int, _ goal: Int, _ k: Int) -> Int {
        let mod = 1_000_000_007
        var dp = Array(
            repeating: Array(repeating: 0, count: n + 1), count: goal + 1
        )
        dp[0][0] = 1
        for i in 1...goal {
            for j in 1...min(i, n) {
                dp[i][j] = dp[i - 1][j - 1] * (n - j + 1) % mod
                if (j > k) {
                    dp[i][j] = (dp[i][j] + dp[i - 1][j] * (j - k)) % mod
                }
            }
        }
        return dp[goal][n]
    }
    
    func tests() {
        print(numMusicPlaylists(3, 3, 1)) // 6
        print(numMusicPlaylists(2, 3, 0)) // 6
        print(numMusicPlaylists(2, 3, 1)) // 2
    }
}

