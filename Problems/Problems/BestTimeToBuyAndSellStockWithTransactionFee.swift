class BestTimeToBuyAndSellStockWithTransactionFee {
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        guard prices.count > 1 else { return 0 }
        let n = prices.count
        var free = Array(repeating: 0, count: n)
        var hold = Array(repeating: Int.min, count: n)
        hold[0] = -prices[0]
        for i in 1..<n {
            free[i] = max(free[i - 1], hold[i - 1] + prices[i] - fee)
            hold[i] = max(hold[i - 1], free[i] - prices[i])
        }
        
        return free[n - 1]
    }

    func maxProfit2(_ prices: [Int], _ fee: Int) -> Int {
        guard prices.count > 1 else { return 0 }
        var result = 0
        var hold = -prices[0]
        for i in 1..<prices.count {
            result = max(result, hold + prices[i] - fee)
            hold = max(hold, result - prices[i])
        }
        return result
    }

    func tests() {
        print(maxProfit([1,3,2,8,4,9], 2)) // 8
        print(maxProfit([1,3,2,8,4,9], 5)) // 3
        print(maxProfit([1,3,7,5,10,3], 3)) // 6
    }
}
