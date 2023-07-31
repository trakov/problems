class LongestIncreasingSubsequence {
    func binarySearch(_ lis: [Int], num: Int, right: Int) -> Int {
        var left = 0
        var right = right
        while left < right {
            let mid = (left + right) / 2
            if lis[mid] < num {
                left = mid + 1
            } else {
                right = mid 
            }
        }
        return left
    }
    
    func lengthOfLIS(_ nums: [Int]) -> Int {
        let n = nums.count
        guard n > 1 else { return 1 }
        var lis = Array(repeating: 0, count: n)
        var lisCount = 0
        for num in nums {
            let idx = binarySearch(lis, num: num, right: lisCount)
            if idx == lisCount {
                lisCount += 1
            }
            lis[idx] = num
        }
        return lisCount
    }

    func lengthOfLIS2(_ nums: [Int]) -> Int {
        var dp = Array(repeating: 1, count: nums.count)
        var result = 1
        for j in 1..<nums.count {
            for i in 0..<j where nums[j] > nums[i] {
                dp[j] = max(dp[j], dp[i] + 1)
            }
            result = max(result, dp[j])
        }
        return result
    }

    func tests() {
        print(lengthOfLIS([10,9,2,5,3,7,101,18])) // 4
        print(lengthOfLIS([0,1,0,3,2,3])) // 4
        print(lengthOfLIS([7,7,7,7,7,7,7])) // 1
    }
}
