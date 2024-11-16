class FindthePowerofKSizeSubarraysI {
    func resultsArray(_ nums: [Int], _ k: Int) -> [Int] {
        guard k > 1 else { return nums }
        let n = nums.count
        var result = Array(repeating: -1, count: n - k + 1)
        var consecutiveCount = 1
        for index in 0..<n-1 {
            if nums[index] + 1 == nums[index + 1] {
                consecutiveCount += 1
            } else {
                consecutiveCount = 1
            }
            if consecutiveCount >= k {
                result[index - k + 2] = nums[index + 1]
            }
        }
        return result
    }
    
    func tests() {
        print(resultsArray([1,2,3,4,3,2,5], 3)) // [3,4,-1,-1,-1]
        print(resultsArray([2,2,2,2,2], 4)) // [-1,-1]
        print(resultsArray([3,2,3,2,3,2], 2)) // [-1,3,-1,3,-1]
    }
}

