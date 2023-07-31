class LongestArithmeticSubsequence {
    func longestArithSeqLength(_ nums: [Int]) -> Int {
        guard nums.count > 2 else { return nums.count }
        let n = nums.count
        var result = 2
        var dp = Array(repeating: [Int: Int](), count: n)
        for right in 0..<n {
            for left in 0..<right {
                let diff = nums[left] - nums[right]
                dp[right][diff] = (dp[left][diff] ?? 1) + 1
                result = max(result, dp[right][diff]!)
            }
        }
        return result
    }
    
    func tests() {
        print(longestArithSeqLength([3,6,9,12])) // 4
        print(longestArithSeqLength([9,4,7,2,10])) // 3
        print(longestArithSeqLength([20,1,15,3,10,5,8])) // 4
        print(longestArithSeqLength([99,24,8,6,28,65,60,27,69,29,16,68,89,29,28,99,90,90,85,79,45,71,95,78,55,19,24,85,63,50,65,40,26,35,61,12,81,49,47,39,84,93,79,1,20,45,20,49,32,41,13,42,99,2,95,62,100,94,51,40,89,76,93,39,68,72,17,30,70,26,55,57,8,47,49,93,100,88,18,99])) // 6
    }
}

