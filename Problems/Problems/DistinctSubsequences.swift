final class DistinctSubsequences {
    func numDistinct(_ s: String, _ t: String) -> Int {
        let (s, t) = (Array(s), Array(t))
        let (n, m) = (s.count, t.count)
        var dp = Array(repeating: Array(repeating: -1, count: m), count: n)
        func numDistinct(_ i: Int, _ j: Int) -> Int {
            if j < 0 { return 1 }
            if i < 0 { return 0 }
            if dp[i][j] != -1 { return dp[i][j] }
            if s[i] != t[j] {
                dp[i][j] = numDistinct(i - 1, j)
            } else {
                dp[i][j] = numDistinct(i - 1, j) + numDistinct(i - 1, j - 1)
            }
            return dp[i][j]
        }
        return numDistinct(n - 1, m - 1)
    }
    
    func tests() {
        print(numDistinct("rabbbit", "rabbit")) // 3
        print(numDistinct("babgbag", "bag")) // 5
    }
}
