class LongestPalindromicSubsequence {
    func longestPalindromeSubseq(_ s: String) -> Int {
        let n = s.count
        let s = Array(s)
        var dp = Array(repeating: 1, count: n)
        for i in 1..<n {
            var topRight = 0
            for j in (0..<i).reversed() {
                let temp = dp[j]
                dp[j] = (s[i] == s[j]) ? 2 + topRight : max(dp[j], dp[j + 1])
                topRight = temp
            }
        }
        return dp[0]
    }

    func longestPalindromeSubseq2(_ s: String) -> Int {
        let s = Array(s)
        var cache: [Int: [Int: Int]] = [:] // i: [j: count]
        func lps(_ i: Int, _ j: Int) -> Int {
            if let cached = cache[i]?[j] {
                return cached
            }
            if i > j { return 0 }
            if i == j { return 1 }
            if s[i] == s[j] {
                cache[i, default: [:]][j] = lps(i+1, j-1) + 2
            } else {
                cache[i, default: [:]][j] = max(lps(i+1, j), lps(i, j-1))
            }
            return cache[i]![j]!
        }
        
        return lps(0, s.count - 1)
    }
    
    func tests() {
        print(longestPalindromeSubseq("bbbab")) // 4
        print(longestPalindromeSubseq("cbbd")) // 2
    }
}

