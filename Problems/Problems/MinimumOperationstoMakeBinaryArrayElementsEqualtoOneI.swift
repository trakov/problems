class MinimumOperationstoMakeBinaryArrayElementsEqualtoOneI {
    func minOperations(_ nums: [Int]) -> Int {
        let n = nums.count
        var nums = nums
        var result = 0
        var i = 0
        while i < n {
            guard nums[i] == 0 else { i += 1; continue }
            guard i < n - 2 else { return -1 }
            result += 1
            for j in i+1...i+2 {
                nums[j] = 1 - nums[j]
            }
            i += 1
        }
        return result
    }
    
    func tests() {
        print(minOperations([0,1,1,1,0,0])) // 3
        print(minOperations([0,1,1,1])) // -1
    }
}

