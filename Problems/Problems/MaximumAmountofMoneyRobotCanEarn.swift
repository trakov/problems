final class MaximumAmountofMoneyRobotCanEarn {
    func maximumAmount(_ coins: [[Int]]) -> Int {
        let n = coins[0].count
        var dp = Array(repeating: Array(repeating: Int.min / 2, count: 3), count: n + 1)
        for i in 0..<3 {
            dp[1][i] = 0
        }
        for row in coins {
            for (j, x) in row.enumerated() {
                dp[j+1][2] = max(dp[j][2] + x, dp[j+1][2] + x, dp[j][1], dp[j+1][1])
                dp[j+1][1] = max(dp[j][1] + x, dp[j+1][1] + x, dp[j][0], dp[j+1][0])
                dp[j+1][0] = max(dp[j][0] + x, dp[j+1][0] + x)
            }
        }
        return dp[n][2]
    }
    
    func tests() {
        print(maximumAmount([[0,1,-1],[1,-2,3],[2,-3,4]])) // 8
        print(maximumAmount([[10,10,10],[10,10,10]])) // 40
    }
}
