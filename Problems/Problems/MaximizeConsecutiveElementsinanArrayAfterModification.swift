final class MaximizeConsecutiveElementsinanArrayAfterModification {
    func maxSelectedElements(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        var dp: [Int: Int] = [:]
        var result = 0
        for num in nums {
            dp[num + 1] = max(dp[num + 1] ?? 0, (dp[num] ?? 0) + 1)
            dp[num] = max(dp[num] ?? 0, (dp[num - 1] ?? 0) + 1)
            result = max(result, dp[num]!, dp[num + 1]!)
        }
        return result
    }
    
    func tests() {
        print(maxSelectedElements([2,1,5,1,1])) // 3
        print(maxSelectedElements([1,4,7,10])) // 1
    }
}
