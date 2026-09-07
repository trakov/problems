final class DistinctSubsequencesII {
    func distinctSubseqII(_ s: String) -> Int {
        let MOD = 1_000_000_007
        let n = s.count
        var dp = Array(repeating: 0, count: n + 1)
        dp[0] = 1
        var last = Array(repeating: -1, count: 26)
        for (i, c) in s.enumerated() {
            let x = Int(c.asciiValue! - Character("a").asciiValue!)
            dp[i + 1] = (dp[i] * 2) % MOD
            if last[x] >= 0 {
                dp[i + 1] -= dp[last[x]]
            }
            dp[i + 1] %= MOD
            last[x] = i
        }
        return (dp[n] + MOD - 1) % MOD
    }
    
    func tests() {
        print(distinctSubseqII("abc")) // 7
        print(distinctSubseqII("aba")) // 6
        print(distinctSubseqII("aaa")) // 3
    }
}
