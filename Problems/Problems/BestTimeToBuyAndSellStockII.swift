class BestTimeToBuyAndSellStockII {
    func maxProfit(_ prices: [Int]) -> Int {
        let n = prices.count
        guard n > 1 else { return 0 }
        var result = 0
        for i in 1..<n {
            let profit = prices[i] - prices[i - 1]
            result += max(0, profit)
        }
        return result
    }

    func tests() {
        print(maxProfit([7,1,5,3,6,4])) // 7
        print(maxProfit([1,2,3,4,5])) // 4
        print(maxProfit([7,6,4,3,1])) // 0
    }
}
