class NthTribonacciNumber {
    func tribonacci(_ n: Int) -> Int {
        guard n > 0 else { return 0 }
        guard n > 2 else { return 1 }
        var dp0 = 0
        var dp1 = 1
        var dp2 = 1
        for i in 2..<n {
            (dp2, dp1, dp0) = (dp2 + dp1 + dp0, dp2, dp1)
        }
        return dp2
    }

    func tribonacci2(_ n: Int) -> Int {
        guard n > 2 else { return min(n, 1) }
        var dp: [Int] = Array(repeating: 1, count: n+1)
        dp[0] = 0
        for i in 3...n {
            dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
        }
        return dp[n]
    }

    func tests() {
        print(tribonacci(0)) // 0
        print(tribonacci(1)) // 1
        print(tribonacci(2)) // 1
        print(tribonacci(3)) // 2
        print(tribonacci(4)) // 4
        print(tribonacci(25)) // 1389537
    }
}
