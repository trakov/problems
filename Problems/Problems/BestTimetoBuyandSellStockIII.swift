class BestTimetoBuyandSellStockIII {
    func maxProfit(_ prices: [Int]) -> Int {
        var t1Cost = Int.max
        var t2Cost = Int.max
        var t1Profit = 0
        var t2Profit = 0
        for price in prices {
            t1Cost = min(t1Cost, price)
            t1Profit = max(t1Profit, price - t1Cost)
            t2Cost = min(t2Cost, price - t1Profit)
            t2Profit = max(t2Profit, price - t2Cost)
        }
        return t2Profit
    }
    
    func tests() {
        print(maxProfit([3,3,5,0,0,3,1,4])) // 6
        print(maxProfit([1,2,3,4,5])) // 4
        print(maxProfit([7,6,4,3,1])) // 0
    }
}

