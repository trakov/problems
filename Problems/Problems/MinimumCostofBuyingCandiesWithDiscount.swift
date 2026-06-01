final class MinimumCostofBuyingCandiesWithDiscount {
    func minimumCost(_ cost: [Int]) -> Int {
        let cost = cost.sorted(by: >)
        var result = 0
        for (i, c) in cost.enumerated() {
            if (i + 1) % 3 != 0 {
                result += c
            }
        }
        return result
    }
    
    func tests() {
        print(minimumCost([1,2,3])) // 5
        print(minimumCost([6,5,7,9,2,2])) // 23
        print(minimumCost([5,5])) // 10
    }
}
