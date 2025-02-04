class MaximumAscendingSubarraySum {
    func maxAscendingSum(_ nums: [Int]) -> Int {
        var result = nums[0]
        var cur = nums[0]
        
        for (i, num) in nums.enumerated().dropFirst() {
            if nums[i-1] < num {
                cur += num
            } else {
                cur = num
            }
            result = max(result, cur)
        }
        
        return result
    }
    
    func tests() {
        print(maxAscendingSum([10,20,30,5,10,50])) // 65
        print(maxAscendingSum([10,20,30,40,50])) // 150
        print(maxAscendingSum([12,17,15,13,10,11,12])) // 33
    }
}

