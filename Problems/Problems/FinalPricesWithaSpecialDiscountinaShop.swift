class FinalPricesWithaSpecialDiscountinaShop {
    // monotonic stack
    func finalPrices(_ prices: [Int]) -> [Int] {
        var stack: [Int] = []
        var result = prices
        for (i, price) in prices.enumerated() {
            while !stack.isEmpty && prices[stack.last!] >= price {
                result[stack.removeLast()] -= price
            }
            stack.append(i)
        }
        return result
    }

    // brute-force
    func finalPrices1(_ prices: [Int]) -> [Int] {
        let n = prices.count
        guard n > 1 else { return prices }
        var result = prices
        for (i, price) in prices.enumerated().dropLast() {
            var discount = 0
            for j in i+1..<n where prices[j] <= price {
                discount = prices[j]
                break
            }
            result[i] -= discount
        }
        return result
    }
    
    func tests() {
        print(finalPrices([8,4,6,2,3])) // [4,2,4,2,3]
        print(finalPrices([1,2,3,4,5])) // [1,2,3,4,5]
        print(finalPrices([10,1,1,6])) // [9,0,1,6]
    }
}

