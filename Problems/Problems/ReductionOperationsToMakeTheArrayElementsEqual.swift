class ReductionOperationsToMakeTheArrayElementsEqual {
    func reductionOperations(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return 0 }
        let nums = nums.sorted(by: >)
        var result = 0
        var index = 0
        for i in 1..<nums.count where nums[index] > nums[i] {
            result += i
            index = i
        }
        return result
    }
    
    func tests() {
        print(reductionOperations([5,1,3])) // 3
        print(reductionOperations([1,1,1])) // 0
        print(reductionOperations([1,1,2,2,3])) // 4
    }
}

