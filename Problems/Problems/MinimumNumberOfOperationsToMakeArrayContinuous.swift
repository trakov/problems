class MinimumNumberOfOperationsToMakeArrayContinuous {
    func minOperations(_ nums: [Int]) -> Int {
        let n = nums.count
        let newNums = Array(Set(nums)).sorted()
        var j = 0
        var result = n
        for i in 0..<newNums.count {
            while j < newNums.count && newNums[j] < newNums[i] + n {
                j += 1
            }
            result = min(result, n + i - j)
        }
        return result
    }
    
    func tests() {
        print(minOperations([4,2,5,3])) // 0
        print(minOperations([1,2,3,5,6])) // 1
        print(minOperations([1,10,100,1000])) // 3
    }
}

