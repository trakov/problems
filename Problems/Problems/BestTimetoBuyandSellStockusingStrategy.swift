final class BestTimetoBuyandSellStockusingStrategy {
    func maxProfit(_ prices: [Int], _ strategy: [Int], _ k: Int) -> Int {
        let n = prices.count
        var profitSum = Array(repeating: 0, count: n + 1)
        var priceSum = Array(repeating: 0, count: n + 1)
        for (i, price) in prices.enumerated() {
            profitSum[i + 1] = profitSum[i] + price * strategy[i]
            priceSum[i + 1] = priceSum[i] + price
        }
        var result = profitSum[n]
        for i in k-1..<n {
            let leftProfit = profitSum[i - k + 1]
            let rightProfit = profitSum[n] - profitSum[i + 1]
            let changeProfit = priceSum[i + 1] - priceSum[i - k / 2 + 1]
            result = max(result, leftProfit + changeProfit + rightProfit)
        }
        return result
    }
    
    func tests() {
        print(maxProfit([4,2,8], [-1,0,1], 2)) // 10
        print(maxProfit([5,4,3], [1,1,0], 2)) // 9
    }
}
