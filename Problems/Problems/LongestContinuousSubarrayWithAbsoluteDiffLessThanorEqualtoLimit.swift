class LongestContinuousSubarrayWithAbsoluteDiffLessThanorEqualtoLimit {
    func longestSubarray(_ nums: [Int], _ limit: Int) -> Int {
        let n = nums.count
        let maxDeque = Deque(n)
        let minDeque = Deque(n)
        var left = 0
        var result = 0
        for (i, num) in nums.enumerated() {
            while !maxDeque.isEmpty && maxDeque.right < num {
                maxDeque.removeRight()
            }
            maxDeque.insertRight(num)
            while !minDeque.isEmpty && minDeque.right > num {
                minDeque.removeRight()
            }
            minDeque.insertRight(num)
            while maxDeque.left - minDeque.left > limit {
                if maxDeque.left == nums[left] {
                    maxDeque.removeLeft()
                }
                if minDeque.left == nums[left] {
                    minDeque.removeLeft()
                }
                left += 1
            }
            result = max(result, i - left + 1)
        }
        return result
    }
    
    func tests() {
        print(longestSubarray([8,2,4,7], 4)) // 2
        print(longestSubarray([10,1,2,4,7,2], 5)) // 4
        print(longestSubarray([4,2,2,2,4,4,2,2], 0)) // 3
    }
}

