class LongestCommonSubsequence {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let text1 = Array(text1)
        let text2 = Array(text2)
        var dp = Array(repeating: Array(repeating: 0, count: text2.count + 1), count: text1.count + 1)

        for i in 0 ..< dp.count - 1 {
            for j in 0 ..< dp[i].count - 1 {
                if text1[i] == text2[j] {
                    dp[i+1][j+1] = 1 + dp[i][j]
                } else {
                    dp[i+1][j+1] = max(dp[i][j+1], dp[i+1][j])
                }
            }
        }

        return dp.last!.last!
    }

    func longestCommonSubsequence2(_ text1: String, _ text2: String) -> Int {
        text2.count - text1.difference(from: text2).removals.count
    }

    func tests() {
        print(longestCommonSubsequence("abcde", "ace")) // 3
        print(longestCommonSubsequence("abc", "abc")) // 3
        print(longestCommonSubsequence("abc", "def")) // 0
    }
}
