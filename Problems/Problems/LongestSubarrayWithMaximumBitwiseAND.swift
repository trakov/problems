class LongestSubarrayWithMaximumBitwiseAND {
    func longestSubarray(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return nums.isEmpty ? 0 : 1 }
        var maxVal = nums[0]
        var maxCount = 1
        var cur = nums[0]
        var count = 1
        for num in (nums + [0]).dropFirst() {
            if num == cur {
                count += 1
            } else {
                if cur > maxVal {
                    maxVal = cur
                    maxCount = count
                } else if cur == maxVal {
                    maxCount = max(maxCount, count)
                }
                count = 1
                cur = num
            }
        }
        return maxCount
    }
    
    func tests() {
        print(longestSubarray([1,2,3,3,2,2])) // 2
        print(longestSubarray([1,2,3,4])) // 1
        print(longestSubarray([1,1,1,2])) // 1
        print(longestSubarray([3,3,2,2,2,1,1,1,1,1])) // 2
        print(longestSubarray([395808,395808,395808,395808,395808,395808,395808,395808,395808,395808,395808,395808,395808,395808,395808,395808,395808,395808,395808,395808,395808,395808,395808,395808,395808,395808,395808,395808,395808,395808,395808,395808,395808,395808,395808,395808,395808,395808,395808,395808,395808,395808,395808,395808,395808,470030,470030,470030,470030,470030,470030,470030,470030,470030,470030,470030,470030,470030,470030,470030,470030,470030,470030,470030,470030,470030,470030,470030,470030,153490,330001,330001,330001,330001,330001,330001,330001,37284,470030,470030,470030,470030,470030,470030,156542,226743])) // 24
    }
}

