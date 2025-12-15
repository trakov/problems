final class NumberofSmoothDescentPeriodsofaStock {
    func getDescentPeriods(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 1 }
        var result = prices.count
        var count = 0
        for (i, price) in (prices + [Int.max]).enumerated().dropFirst() {
            if price == prices[i-1] - 1 {
                count += 1
                result += count
            } else {
                count = 0
            }
        }
        return result
    }
    
    func tests() {
        print(getDescentPeriods([4,3,2,1])) // 10
        print(getDescentPeriods([3,2,1,4])) // 7
        print(getDescentPeriods([8,6,7,7])) // 4
        print(getDescentPeriods([1])) // 1
    }
}
