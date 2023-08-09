class MinimizeTheMaximumDifferenceOfPairs {
    func minimizeMax(_ nums: [Int], _ p: Int) -> Int {
        let nums = nums.sorted()
        let n = nums.count
        func countValidPairs(_ threshold: Int) -> Int {
            var index = 0
            var count = 0
            while index < n - 1 {
                if nums[index + 1] - nums[index] <= threshold {
                    count += 1
                    index += 1
                }
                index += 1
            }
            return count
        }
        var left = 0
        var right = nums.last! - nums[0]
        while left < right {
            let mid = left + (right - left) / 2
            if countValidPairs(mid) >= p {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
    
    func tests() {
        print(minimizeMax([10,1,2,7,1,3], 2)) // 1
        print(minimizeMax([4,2,1,2], 1)) // 0
        print(minimizeMax([2], 0))
        print(minimizeMax([2], 2))
    }
}

