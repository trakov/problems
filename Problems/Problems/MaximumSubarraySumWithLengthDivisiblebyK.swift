final class MaximumSubarraySumWithLengthDivisiblebyK {
    func maxSubarraySum(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        var prefixSum = 0
        var maxSum = Int.min
        var kSum = Array(repeating: Int.max / 2, count: k)
        kSum[k - 1] = 0
        for i in 0..<n {
            prefixSum += nums[i]
            maxSum = max(maxSum, prefixSum - kSum[i % k])
            kSum[i % k] = min(kSum[i % k], prefixSum)
        }
        return maxSum
    }
    
    func tests() {
        print(maxSubarraySum([1,2], 1)) // 3
        print(maxSubarraySum([-1,-2,-3,-4,-5], 4)) // -10
        print(maxSubarraySum([-5,1,2,-3,4], 2)) // 4
    }
}
