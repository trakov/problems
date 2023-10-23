class MaximumScoreOfAGoodSubarray {
    func maximumScore(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        var left = k
        var right = k
        var result = nums[k]
        var currMin = nums[k]
        while left > 0 || right < n - 1 {
            if (left > 0 ? nums[left - 1] : 0) < (right < n - 1 ? nums[right + 1] : 0) {
                right += 1
                currMin = min(currMin, nums[right])
            } else {
                left -= 1
                currMin = min(currMin, nums[left])
            }
            result = max(result, currMin * (right - left + 1))
        }
        return result
    }
    
    func tests() {
        print(maximumScore([1,4,3,7,4,5], 3)) // 15
        print(maximumScore([5,5,4,5,4,1,1,1], 0)) // 20
    }
}

