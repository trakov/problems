class MinimumSizeSubarraySum {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var result = Int.max
        var left = 0
        var tempSum = 0
        
        for (i, num) in nums.enumerated() {
            guard num < target else { return 1 }
            tempSum += num
            while tempSum >= target {
                result = min(result, i - left + 1)
                tempSum -= nums[left]
                left += 1
            }
        }
        
        return result == Int.max ? 0 : result
    }

    func tests() {
        print(minSubArrayLen(7, [2,3,1,2,4,3])) // 2
        print(minSubArrayLen(4, [1,4,4])) // 1
        print(minSubArrayLen(11, [1,1,1,1,1,1,1,1])) // 0

    }
}
