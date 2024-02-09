class LargestDivisibleSubset {
    func largestDivisibleSubset(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var dp = Array(repeating: 1, count: n)
        let nums = nums.sorted()
        var maxCount = 1
        var maxIndex = 0
        for i in 1..<n {
            for j in 0..<i {
                if nums[i] % nums[j] == 0 {
                    dp[i] = max(dp[i], dp[j] + 1)
                    if dp[i] > maxCount {
                        maxCount = dp[i]
                        maxIndex = i
                    }
                }
            }
        }
        var result: [Int] = []
        var num = nums[maxIndex]
        for i in (0...maxIndex).reversed() where num % nums[i] == 0 && dp[i] == maxCount {
            result.append(nums[i])
            num = nums[i]
            maxCount -= 1
        }
        return result
    }
    
    func tests() {
        print(largestDivisibleSubset([1,2,3,4,6,24])) // [1,2,4,24]
        print(largestDivisibleSubset([1,2,3])) // [1,2] [1,3]
        print(largestDivisibleSubset([1,2,4,8])) // [1,2,4,8]
    }
}

