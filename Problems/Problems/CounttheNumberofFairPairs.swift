class CounttheNumberofFairPairs {
    func countFairPairs(_ nums: [Int], _ lower: Int, _ upper: Int) -> Int {
        let nums = nums.sorted()
        var result = 0
        var (left, right) = (0, nums.count - 1)
        while left < right {
            if nums[left] + nums[right] <= upper {
                result += right - left
                left += 1
            } else {
                right -= 1
            }
        }
        (left, right) = (0, nums.count - 1)
        while left < right {
            if nums[left] + nums[right] <= lower - 1 {
                result -= right - left
                left += 1
            } else {
                right -= 1
            }
        }
        return result
    }
    
    func tests() {
        print(countFairPairs([0,1,7,4,4,5], 3, 6)) // 6
        print(countFairPairs([1,7,9,2,5], 11, 11)) // 1
    }
}

