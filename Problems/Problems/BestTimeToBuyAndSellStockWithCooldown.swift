class BestTimeToBuyAndSellStockWithCooldown {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 }
        var rest = 0
        var hold = Int.min
        var sold = 0
        for price in prices {
            let prevSold = sold
            // keep holding or buy new stock - buy action
            hold = max(hold, rest - price)
            // just sell new stock - sell action
            sold = hold + price
            // keep resting or use last sold
            rest = max(rest, prevSold)
        }
        return max(rest, sold)
    }
    
    struct PriceBuying: Hashable {
        var index: Int
        var buying: Bool
    }
    func maxProfit2(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 }
        var dp: [PriceBuying: Int] = [:] // (index, buying): profit
        func dfs(pB: PriceBuying) -> Int {
            guard pB.index < prices.count else { return 0 }
            if dp[pB] != nil { return dp[pB]! }
            let cooldown = dfs(pB: PriceBuying(index: pB.index + 1, buying: pB.buying))
            if pB.buying {
                let buy = dfs(pB: PriceBuying(index: pB.index + 1, buying: false)) - prices[pB.index]
                dp[pB] = max(buy, cooldown)
            } else {
                let sell = dfs(pB: PriceBuying(index: pB.index + 2, buying: true)) + prices[pB.index]
                dp[pB] = max(sell, cooldown)
            }
            return dp[pB]!
        }
        return dfs(pB: PriceBuying(index: 0, buying: true))
    }
    
    func dpArray(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 }
        var dp = Array(repeating: 0, count: prices.count)
        for i in 1..<prices.count {
            for j in (0..<i).reversed() {
                dp[i] = max(dp[i], prices[i] - prices[j] + (j >= 2 ? dp[j - 2] : 0))
            }
            dp[i] = max(dp[i], dp[i - 1])
        }
        return dp.last!
    }

    func tests() {
        print(maxProfit([1,2,4])) // 3
        print(maxProfit([1,2,3,0,2])) // 3
        print(maxProfit([1])) // 0
        print(maxProfit([1,1,0,3,4,1])) // 4
    }
}
