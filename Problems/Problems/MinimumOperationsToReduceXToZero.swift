class MinimumOperationsToReduceXToZero {
    func minOperations(_ nums: [Int], _ x: Int) -> Int {
        var left = 0
        var sum = nums.reduce(0, +)
        guard sum >= x else { return -1 }
        guard sum > x else { return nums.count }
        var result = -1
        for (right, num) in nums.enumerated() {
            sum -= num
            while sum < x && left <= right {
                sum += nums[left]
                left += 1
            }
            if sum == x {
                result = max(result, right - left + 1)
            }
        }
        
        return result == -1 ? result : nums.count - result
    }
    
    func tests() {
        print(minOperations([1,1,4,2,3], 5)) // 2
        print(minOperations([1,1,4,2,3], 11)) // 5
        print(minOperations([5,6,7,8,9], 4)) // -1
        print(minOperations([3,2,20,1,1,3], 10)) // 5
    }
}

