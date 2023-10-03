class NumberOfGoodPairs {
    func numIdenticalPairs(_ nums: [Int]) -> Int {
        var map: [Int: Int] = [:]
        var result = 0
        for num in nums {
            result += map[num] ?? 0
            map[num, default: 0] += 1
        }
        return result
    }
    
    func tests() {
        print(numIdenticalPairs([1,2,3,1,1,3])) // 4
        print(numIdenticalPairs([1,1,1,1])) // 6
        print(numIdenticalPairs([1,2,3])) // 0
    }
}

