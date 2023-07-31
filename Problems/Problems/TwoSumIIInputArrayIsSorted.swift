class TwoSumIIInputArrayIsSorted {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        for (i, n) in numbers.enumerated() {
            let compl = target - n
            var left = i + 1
            var right = numbers.count - 1
            while left <= right {
                let middle = (left + right) / 2
                if numbers[middle] < compl {
                    left = middle + 1
                } else if numbers[middle] > compl {
                    right = middle - 1
                } else {
                    return [i + 1, middle + 1]
                }
            }
        }
        
        preconditionFailure()
    }
    
    func mapSolution(_ numbers: [Int], _ target: Int) -> [Int] {
        var map: [Int: Int] = [:] // num:index
        for (i, num) in numbers.enumerated() {
            let compl = target - num
            if map[compl] != nil {
                return [map[compl]!, i + 1]
            }
            map[num] = i + 1
        }
        return []
    }

    func tests() {
        print(twoSum([2,7,11,15], 9)) // [1,2]
        print(twoSum([2,3,4], 6)) // [1,3]
        print(twoSum([-1,0], -1)) // [1,2]
    }
}
