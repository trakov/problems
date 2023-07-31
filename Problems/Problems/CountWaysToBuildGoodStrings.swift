class CountWaysToBuildGoodStrings {
    func countGoodStrings(_ low: Int, _ high: Int, _ zero: Int, _ one: Int) -> Int {
        let mod = 1_000_000_007
        var dp = Array(repeating: 0, count: high + 1)
        dp[zero] = 1
        dp[one] += 1
        for i in 1...high {
            if zero <= i {
                dp[i] = (dp[i] + dp[i - zero]) % mod
            }
            if one <= i {
                dp[i] = (dp[i] + dp[i - one]) % mod
            }
        }
        var result = 0
        for i in low...high {
            result = (result + dp[i]) % mod
        }
        return result
    }
    
    func tests() {
        print(countGoodStrings(500, 500, 5, 2)) //
        print(countGoodStrings(3, 3, 1, 1)) // 8
        print(countGoodStrings(2, 3, 1, 2)) // 5
    }
}

