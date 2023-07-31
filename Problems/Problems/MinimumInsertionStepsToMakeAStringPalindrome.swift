class MinimumInsertionStepsToMakeAStringPalindrome {
    func minInsertions(_ s: String) -> Int {
        let n = s.count
        guard n > 1 else { return 0 }
        var dp = Array(repeating: 0, count: n)
        let s = Array(s)
        for i in (0..<n).reversed() {
            dp[i] = 1
            var prevDP = dp
            for j in i+1..<n {
                if s[i] == s[j] {
                    prevDP[j] = dp[j-1] + 2
                } else {
                    prevDP[j] = max(prevDP[j-1], dp[j])
                }
            }
            dp = prevDP
        }
        return n - dp[n-1]
    }

    func minInsertions2(_ s: String) -> Int {
        let s = Array(s)
        var dp = Array(
            repeating: Array(
                repeating: -1, count: s.count
            ), count: s.count
        )
        func helper(left: Int, right: Int) -> Int {
            if left >= right { return 0 }
            if dp[left][right] != -1 {
                return dp[left][right]
            }
            if s[left] == s[right] {
                dp[left][right] = helper(left: left + 1, right: right - 1)
            } else {
                dp[left][right] = min(
                    helper(left: left + 1, right: right),
                    helper(left: left, right: right - 1)
                ) + 1
            }
            return dp[left][right]
        }
        return helper(left: 0, right: s.count - 1)
    }
    
    func tests() {
        print(minInsertions("tldjbqjdogipebqsohdypcxjqkrqltpgviqtqz")) // 25
        print(minInsertions("ab")) // 1
        print(minInsertions("abc")) // 2
        print(minInsertions("abca")) // 1
        print(minInsertions("zzazz")) // 0
        print(minInsertions("mbadm")) // 2
        print(minInsertions("leetcode")) // 5
    }
}

