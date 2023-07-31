class TargetSum {
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        let sum = nums.reduce(0, +)
        var dp = Array(repeating: 0, count: 2 * sum + 1)
        dp[nums[0] + sum] = 1
        dp[-nums[0] + sum] += 1
        
        for i in 1..<nums.count {
            var next = Array(repeating: 0, count: 2 * sum + 1)
            for sub in -sum...sum {
                if dp[sub + sum] > 0 {
                    next[sub + nums[i] + sum] += dp[sub + sum]
                    next[sub - nums[i] + sum] += dp[sub + sum]
                }
            }
            dp = next;
        }
        
        return abs(target) > sum ? 0 : dp[target + sum]
    }

    func tests() {
        print(findTargetSumWays([1,1,1,1,1], 3)) // 5
        print(findTargetSumWays([1], 1)) // 1
    }
}
