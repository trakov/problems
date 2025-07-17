final class FindtheMaximumLengthofValidSubsequenceII {
    func maximumLength(_ nums: [Int], _ k: Int) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: k), count: k)
        var result = 0
        for num in nums {
            let val = num % k
            for i in 0..<k {
                dp[i][val] = dp[val][i] + 1
                result = max(result, dp[i][val])
            }
        }
        return result
    }
    
    func tests() {
        print(maximumLength([1,2,3,4,5], 2)) // 5
        print(maximumLength([1,4,2,3,1,4], 3)) // 4
        print(maximumLength([1,2,3,10,2], 6)) // 3
    }
}
