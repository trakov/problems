class MaximumIceCreamBars {
    func maxIceCream(_ costs: [Int], _ coins: Int) -> Int {
        let costs = costs.sorted()
        var result = 0
        var coins = coins
        for cost in costs {
            if coins >= cost {
                coins -= cost
                result += 1
            } else {
                break
            }
        }
        return result
    }

    func tests() {
        print(maxIceCream([1,3,2,4,1], 7)) // 4
        print(maxIceCream([10,6,8,7,7,8], 5)) // 0
        print(maxIceCream([1,6,3,1,2,5], 20)) // 6
    }
}
