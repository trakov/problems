class MaximumAbsoluteSumofAnySubarray {
    func maxAbsoluteSum(_ nums: [Int]) -> Int {
        var minPrefixSum = 0
        var maxPrefixSum = 0
        var sum = 0
        for num in nums {
            sum += num
            minPrefixSum = min(minPrefixSum, sum)
            maxPrefixSum = max(maxPrefixSum, sum)
        }
        return maxPrefixSum - minPrefixSum
    }
    
    func tests() {
        print(maxAbsoluteSum([1,-3,2,3,-4])) // 5
        print(maxAbsoluteSum([2,-5,1,-4,3,-2])) // 8
    }
}

