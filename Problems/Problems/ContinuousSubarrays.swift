class ContinuousSubarrays {
    func continuousSubarrays(_ nums: [Int]) -> Int {
        let n = nums.count
        var (left, right) = (0, 0)
        var (curMin, curMax) = (nums[right], nums[right])
        var (windowLen, result) = (0, 0)
        while right < n {
            curMin = min(curMin, nums[right])
            curMax = max(curMax, nums[right])
            if (curMax - curMin > 2) {
                windowLen = right - left
                result += ((windowLen * (windowLen + 1)) / 2)
                left = right
                (curMin, curMax) = (nums[right], nums[right])
                
                while left > 0 && abs(nums[right] - nums[left - 1]) <= 2 {
                    left -= 1
                    curMin = min(curMin, nums[left])
                    curMax = max(curMax, nums[left])
                }
                if left < right {
                    windowLen = right - left
                    result -= ((windowLen * (windowLen + 1)) / 2)
                }
            }
            right += 1
        }
        windowLen = right - left
        result += ((windowLen * (windowLen + 1)) / 2)
        return result
    }
    
    func tests() {
        print(continuousSubarrays([5,4,2,4])) // 8
        print(continuousSubarrays([1,2,3])) // 6
    }
}

