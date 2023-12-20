class BuyTwoChocolates {
    func buyChoco(_ prices: [Int], _ money: Int) -> Int {
        var min1 = Int.max
        var min2 = Int.max
        for price in prices {
            if price < min1 {
                (min2, min1) = (min1, price)
            } else {
                min2 = min(min2, price)
            }
        }
        let result = money - min1 - min2
        return result < 0 ? money : result
    }
    
    func tests() {
        print(buyChoco([1,2,2], 3)) // 0
        print(buyChoco([3,2,3], 3)) // 3
    }
}

