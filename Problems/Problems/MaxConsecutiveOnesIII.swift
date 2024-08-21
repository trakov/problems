class MaxConsecutiveOnesIII {
    func longestOnes(_ nums: [Int], _ k: Int) -> Int {
        var left = 0
        var result = 0
        var remain = k
        for right in 0..<nums.count {
            if nums[right] == 0 {
                if remain > 0 {
                    remain -= 1
                    result = max(result, right - left + 1)
                } else {
                    while nums[left] == 1 {
                        left += 1
                    }
                    left += 1
                }
            } else {
                result = max(result, right - left + 1)
            }
        }
        return result
    }
    
    func tests() {
        print(longestOnes([1,1,1,0,0,0,1,1,1,1,0], 2)) // 6
        print(longestOnes([0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], 3)) // 10
    }
}

