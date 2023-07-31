class NumberOfLongestIncreasingSubsequence {
    func findNumberOfLIS(_ nums: [Int]) -> Int {
        var lis = Array(repeating: 1, count: nums.count)
        var count = Array(repeating: 1, count: nums.count)
        var longest = 1
        for i in 0..<nums.count {
            for j in 0..<i {
                if nums[i] > nums[j] && lis[i] < lis[j] + 1 {
                    lis[i] = lis[j] + 1
                    count[i] = count[j]
                } else if lis[i] == lis[j] + 1 {
                    count[i] += count[j]
                }
                longest = max(longest, lis[i])
            }
        }
        var result = 0
        for (i, len) in lis.enumerated() where len == longest {
            result += count[i]
        }
        return result
    }

    func tests() {
        print(findNumberOfLIS([1,3,5,4,7])) // 2
        print(findNumberOfLIS([2,2,2,2,2])) // 5
    }
}
