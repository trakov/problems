class LongestPalindromicSubstring {
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 1 else { return s }
        let s = Array(s)
        var left = 0
        var right = 0
        var dp = Array(repeating: Array(repeating: false, count: s.count), count: s.count)
        for i in 1..<s.count {
            for j in 0..<i {
                guard s[j] == s[i] && (dp[j+1][i-1] || i - j <= 2) else { continue }
                dp[j][i] = true
                if i - j > right - left {
                    left = j
                    right = i
                }
            }
        }
        return String(s[left...right])
    }

    func tests() {
        print(longestPalindrome("babad")) // bab // aba
        print(longestPalindrome("cbbd")) // bb
    }
}
