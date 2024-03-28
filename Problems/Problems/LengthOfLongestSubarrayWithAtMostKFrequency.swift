class LengthOfLongestSubarrayWithAtMostKFrequency {
    func maxSubarrayLength(_ nums: [Int], _ k: Int) -> Int {
        var result = 0
        var left = -1
        var map: [Int: Int] = [:]
        for right in 0..<nums.count {
            map[nums[right], default: 0] += 1
            while map[nums[right]]! > k {
                left += 1
                map[nums[left], default: 0] -= 1
            }
            result = max(result, right - left)
        }
        return result
    }

    func tests() {
        print(maxSubarrayLength([1,2,3,1,2,3,1,2], 2)) // 6
        print(maxSubarrayLength([1,2,1,2,1,2,1,2], 1)) // 2
        print(maxSubarrayLength([5,5,5,5,5,5,5], 4)) // 4
        print(maxSubarrayLength([1,2,2,3], 1)) // 0
        print(maxSubarrayLength([1], 1)) // 1
        print(maxSubarrayLength([1, 2], 2)) // 2
    }
}

