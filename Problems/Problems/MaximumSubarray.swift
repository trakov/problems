class MaximumSubarray {
    func maxSubArray(_ nums: [Int]) -> Int {
        var curSum = nums[0], maxSum = nums[0]
        for i in 1..<nums.count {
            curSum = max(nums[i], curSum + nums[i])
            maxSum = max(maxSum, curSum)
        }
        return maxSum
    }
    
    func tests() {
        print(maxSubArray([-5,8,-5,1,1,-3,5,5,-3,-3,6,4,-7,-4,-8,0,-1,-6])) // 16
        print(maxSubArray([-2,-1])) // -1
        print(maxSubArray([-9,-2,1,8,7,-6,4,9,-9,-5,0,5,-2,5,9,7])) // 33
        print(maxSubArray([-2,1,-3,4,-1,2,1,-5,4,-1,-2])) // 6
        print(maxSubArray([-2,1,-3,4,-1,2,1,-5,4])) // 6
        print(maxSubArray([1])) // 1
        print(maxSubArray([5,4,-1,7,8])) // 23
    }
}
