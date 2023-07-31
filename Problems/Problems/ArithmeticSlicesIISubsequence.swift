class ArithmeticSlicesIISubsequence {
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        var total = 0
        let n = nums.count
        var dp = Array(repeating: [Int: Int](), count: n)
        for i in 1..<n {
            for j in 0..<i {
                let diff = nums[j] - nums[i]
                dp[i][diff, default: 0] += dp[j][diff, default: 0] + 1
                total += dp[j][diff, default: 0]
            }
        }
        return total
    }
    
    func tests() {
        print(numberOfArithmeticSlices([2,4,6,8,10])) // 7
        print(numberOfArithmeticSlices([7,7,7,7,7])) // 16
    }
}
