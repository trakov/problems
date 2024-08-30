class BestTimetoBuyandSellStockIV {
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 }
        let k = min(k, prices.count/2)
        var cost = Array(repeating: Int.max, count: k)
        var profit = Array(repeating: 0, count: k)
        for price in prices {
            for i in 0..<k {
                cost[i] = min(cost[i], price - (i > 0 ? profit[i-1] : 0))
                profit[i] = max(profit[i], price - cost[i])
            }
        }
        return profit[k - 1]
    }
    
    func tests() {
        print(maxProfit(2, [2,4,1])) // 2
        print(maxProfit(2, [3,2,6,5,0,3])) // 7
    }
}

