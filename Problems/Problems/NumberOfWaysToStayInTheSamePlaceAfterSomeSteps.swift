class NumberOfWaysToStayInTheSamePlaceAfterSomeSteps {
    func numWays(_ steps: Int, _ arrLen: Int) -> Int {
        let arrLen = min(arrLen, steps/2 + 1)
        var dp = Array(repeating: 0, count: arrLen)
        var prevDp = dp
        prevDp[0] = 1
        let MOD = 1_000_000_007
        for _ in 1...steps {
            dp = Array(repeating: 0, count: arrLen)
            for curr in (0..<arrLen).reversed() {
                var res = prevDp[curr]
                if curr > 0 {
                    res = (res + prevDp[curr - 1]) % MOD
                }
                if curr < arrLen - 1 {
                    res = (res + prevDp[curr + 1]) % MOD
                }
                dp[curr] = res
            }
            prevDp = dp;
        }
        return dp[0]
    }
    
    func tests() {
        print(numWays(3, 2)) // 4
        print(numWays(2, 4)) // 2
        print(numWays(4, 2)) // 8
    }
}

