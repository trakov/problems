final class MaximumNumberofItemsFromSaleI {
    func maximumSaleItems(_ items: [[Int]], _ budget: Int) -> Int {
        var f = Array(repeating: 0, count: budget + 1)
        var mn = Int.max
        for item in items {
            let (factor, price) = (item[0], item[1])
            mn = min(mn, price)
            var count = 0
            for other in items {
                if other[0] % factor == 0 {
                    count += 1
                }
            }
            for j in stride(from: budget, through: price, by: -1) {
                f[j] = max(f[j], f[j - price] + count)
            }
        }
        var result = 0
        for j in 0...budget {
            result = max(result, f[j] + (budget - j) / mn)
        }
        return result
    }
    
    func tests() {
        print(maximumSaleItems([[6,2],[2,6],[3,4]], 9)) // 4
        print(maximumSaleItems([[2,4],[3,2],[4,1],[6,4],[12,4]], 8)) // 10
    }
}
