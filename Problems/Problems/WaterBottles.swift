class WaterBottles {
    func numWaterBottles(_ numBottles: Int, _ numExchange: Int) -> Int {
        numBottles + (numBottles - 1) / (numExchange - 1)
    }

    func numWaterBottles2(_ numBottles: Int, _ numExchange: Int) -> Int {
        var result = numBottles
        var left = numBottles
        while left >= numExchange {
            let temp = left / numExchange
            result += temp
            left += temp * (1 - numExchange)
        }
        return result
    }
    
    func tests() {
        print(numWaterBottles(9, 3)) // 13
        print(numWaterBottles(15, 4)) // 19
    }
}

