class MinimumDifficultyOfAJobSchedule {
    func minDifficulty(_ jobDifficulty: [Int], _ d: Int) -> Int {
        let n = jobDifficulty.count
        guard n >= d else { return -1 }
        guard n > d else { return jobDifficulty.reduce(0, +) }
        var dp = Array(repeating: Array(repeating: Int.max, count: d), count: n)
        dp[0][0] = jobDifficulty[0]
        for i in 1..<n {
            let minD = max(0, d - n + i)
            let maxD = min(d - 1, i)
            for j in minD...maxD {
                if j == 0 {
                    dp[i][j] = max(dp[i - 1][j], jobDifficulty[i])
                    continue
                }
                var maxDifficulty = 0
                for k in stride(from: i, through: j, by: -1) {
                    maxDifficulty = max(maxDifficulty, jobDifficulty[k])
                    dp[i][j] = min(dp[i][j], dp[k - 1][j - 1] + maxDifficulty)
                }
            }
        }
        return dp[n - 1][d - 1]
    }
    
    func tests() {
        print(minDifficulty([6,5,4,3,2,1], 2)) // 7
        print(minDifficulty([9,9,9], 4)) // -1
        print(minDifficulty([1,1,1], 3)) // 3
    }
}

