class StringCompressionII {
    func length(of count: Int) -> Int {
        guard count > 1 else { return count }
        return 1 + count/100 + (count/10).signum() + count.signum()
    }
    
    func getLengthOfOptimalCompression(_ s: String, _ k: Int) -> Int {
        guard s.count > k + 1 else { return max(s.count - k, 0) }
        let n = s.count
        var dp = Array(repeating: Array(repeating: 0, count: k + 1), count: n + 1)
        let s = Array(s)
        for i in (0...n).reversed() {
            for j in 0...k {
                guard i < n else { dp[n][j] = 0; continue }
                dp[i][j] = (j > 0) ? dp[i + 1][j - 1] : Int.max
                var del = j
                var count = 0
                for end in i..<n where del >= 0 {
                    guard s[end] == s[i] else { del -= 1; continue }
                    count += 1
                    dp[i][j] = min(
                        dp[i][j],
                        length(of: count) + dp[end + 1][del]
                    )
                }
            }
        }
        return dp[0][k]
    }
    
    func tests() {
        print(getLengthOfOptimalCompression("abc", 0)) // 3
        print(getLengthOfOptimalCompression("aaabcccd", 2)) // 4
        print(getLengthOfOptimalCompression("aabbaa", 2)) // 2
        print(getLengthOfOptimalCompression("aaaaaaaaaaa", 0)) // 3
    }
}

