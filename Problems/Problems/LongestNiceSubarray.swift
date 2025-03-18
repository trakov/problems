class LongestNiceSubarray {
    func longestNiceSubarray(_ nums: [Int]) -> Int {
        var usedBits = 0
        var left = 0
        var result = 0
        for right in 0..<nums.count {
            while (usedBits & nums[right]) != 0 {
                usedBits ^= nums[left]
                left += 1
            }
            usedBits |= nums[right]
            result = max(result, right - left + 1)
        }
        return result
    }
    
    func tests() {
        print(longestNiceSubarray([1,3,8,48,10])) // 3
        print(longestNiceSubarray([3,1,5,11,13])) // 1
    }
}

