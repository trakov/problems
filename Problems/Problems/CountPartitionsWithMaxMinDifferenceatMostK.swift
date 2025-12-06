final class CountPartitionsWithMaxMinDifferenceatMostK {
    func countPartitions(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        let MOD = 1_000_000_007
        var dp = Array(repeating: 0, count: n + 1)
        dp[0] = 1
        var mx = Array(repeating: 0, count: n)
        var mn = Array(repeating: 0, count: n)
        var mxl = 0, mxr = 0
        var mnl = 0, mnr = 0
        var l = 0
        var sum = 0
        for r in 0..<n {
            while mxl < mxr && nums[mx[mxr - 1]] <= nums[r] { mxr -= 1 }
            while mnl < mnr && nums[mn[mnr - 1]] >= nums[r] { mnr -= 1 }
            mx[mxr] = r; mxr += 1
            mn[mnr] = r; mnr += 1
            while nums[mx[mxl]] - nums[mn[mnl]] > k {
                if mx[mxl] == l { mxl += 1 }
                if mn[mnl] == l { mnl += 1 }
                sum = (sum - dp[l] + MOD) % MOD
                l += 1
            }
            sum = (sum + dp[r]) % MOD
            dp[r + 1] = sum
        }
        return dp[n]
    }

    func tests() {
        print(countPartitions([9,4,1,3,7], 4)) // 6
        print(countPartitions([3,3,4], 0)) // 2
    }
}
