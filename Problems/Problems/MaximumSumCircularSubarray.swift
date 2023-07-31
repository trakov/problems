class MaximumSumCircularSubarray {
    func maxSubarraySumCircular(_ nums: [Int]) -> Int {
        var curMax = 0, curMin = 0, sum = 0, maxSum = nums[0], minSum = nums[0]
        for num in nums {
            curMax = max(curMax, 0) + num
            maxSum = max(maxSum, curMax)
            curMin = min(curMin, 0) + num
            minSum = min(minSum, curMin)
            sum += num
        }
        return sum == minSum ? maxSum : max(maxSum, sum - minSum)
    }
    
    func tests() {
        print(maxSubarraySumCircular([1,-2,3,-2])) // 3
        print(maxSubarraySumCircular([5,-3,5])) // 10
        print(maxSubarraySumCircular([-3,-2,-3])) // -2
    }
}
