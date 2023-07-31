class ReducingDishes {
    func maxSatisfaction(_ satisfaction: [Int]) -> Int {
        let sorted = satisfaction.sorted()
        guard sorted.last! > 0 else { return 0 }
        var result = 0
        var sum = 0
        var index = sorted.count - 1
        while index >= 0 && sorted[index] >= 0 {
            sum += sorted[index]
            result += sum
            index -= 1
        }
        var temp = result
        while temp >= result {
            result = temp
            guard index >= 0 else { break }
            sum += sorted[index]
            temp = result + sum
            index -= 1
        }
        return result
    }
    
    func maxSatisfaction2(_ satisfaction: [Int]) -> Int {
        var satisfaction = satisfaction.sorted()
        var result = 0
        if satisfaction.last! <= 0 {
            return 0
        }
        if satisfaction[0] >= 0 {
            for (i, sat) in satisfaction.enumerated() {
                result += (i + 1) * sat
            }
        }
        while satisfaction[0] <= 0 {
            var temp = 0
            for (i, sat) in satisfaction.enumerated() {
                temp += (i + 1) * sat
            }
            if temp > result {
                result = temp
            }
            satisfaction.removeFirst()
        }
        return result
    }
    
    func tests() {
        print(maxSatisfaction([-2,5,-1,0,3,-3])) // 35
        print(maxSatisfaction([-1,-8,0,5,-9])) // 14
        print(maxSatisfaction([4,3,2])) // 20
        print(maxSatisfaction([-1,-4,-5])) // 0
    }
}

