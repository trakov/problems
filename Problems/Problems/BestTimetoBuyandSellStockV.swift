final class BestTimetoBuyandSellStockV {
    func maximumProfit(_ prices: [Int], _ k: Int) -> Int {
        let n = prices.count
        var dp = Array(repeating: [0,0,0], count: k+1)
        for i in 1...k {
            dp[i][1] = -prices[0]
            dp[i][2] = prices[0]
        }
        for i in 1..<n {
            for j in (1...k).reversed() {
                dp[j][0] = max(
                    dp[j][0],
                    dp[j][1] + prices[i],
                    dp[j][2] - prices[i]
                )
                dp[j][1] = max(dp[j][1], dp[j - 1][0] - prices[i])
                dp[j][2] = max(dp[j][2], dp[j - 1][0] + prices[i])
            }
        }
        return dp[k][0]
    }
    
    func tests() {
        print(maximumProfit([1,7,9,8,2], 2)) // 14
        print(maximumProfit([12,16,19,19,8,1,19,13,9], 3)) // 36
    }
}
