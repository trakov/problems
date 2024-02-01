class DivideArrayIntoArraysWithMaxDifference {
    func divideArray(_ nums: [Int], _ k: Int) -> [[Int]] {
        guard nums.count % 3 == 0 else { return [] }
        let nums = nums.sorted()
        var result = Array(repeating: [Int](), count: nums.count / 3)
        var i = 0
        while i < nums.count {
            guard nums[i + 2] - nums[i] <= k else { return [] }
            result[i / 3] = [nums[i], nums[i + 1], nums[i + 2]]
            i += 3
        }
        return result
    }
    
    func tests() {
        print(divideArray([1,3,4,8,7,9,3,5,1], 2)) // [[1,1,3],[3,4,5],[7,8,9]]
        print(divideArray([1,3,3,2,7,3], 3)) // []
    }
}

