class MinimumNumberOfOperationsToMakeArrayEmpty {
    func minOperations(_ nums: [Int]) -> Int {
        var map: [Int: Int] = [:]
        for num in nums {
            map[num, default: 0] += 1
        }
        var result = 0
        for (_, count) in map {
            guard count > 1 else { return -1 }
            result += count / 3 + (count % 3 == 0 ? 0 : 1)
        }
        return result
    }
    
    func tests() {
        print(minOperations([2,3,3,2,2,4,2,3,4])) // 4
        print(minOperations([2,1,2,2,3,3])) // -1
    }
}

