final class MinimumScorebyChangingTwoElements {
    func minimizeSum(_ nums: [Int]) -> Int {
        let n = nums.count
        guard n > 3 else { return 0 }
        let nums = nums.sorted()
        return min(
            nums[n - 1] - nums[0],
            nums[n - 1] - nums[1],
            nums[n - 1] - nums[2],
            nums[n - 2] - nums[0],
            nums[n - 2] - nums[1],
            nums[n - 3] - nums[0]
        )
    }
    
    func tests() {
        print(minimizeSum([1,4,7,8,5])) // 3
        print(minimizeSum([1,4,3])) // 0
    }
}
