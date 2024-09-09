class RegularExpressionMatching {
    // dp
    func isMatch(_ s: String, _ p: String) -> Bool {
        let s = Array(s)
        let p = Array(p)
        let n = s.count
        let m = p.count
        var dp = Array(repeating: Array(repeating: false, count: m + 1), count: n + 1)
        dp[n][m] = true

        for i in (0...n).reversed() {
            for j in (0...m-1).reversed() {
                let firstMatch = i < n && (p[j] == s[i] || p[j] == ".")
                if j + 1 < m && p[j + 1] == "*" {
                    dp[i][j] = dp[i][j + 2] || (firstMatch && dp[i + 1][j])
                } else {
                    dp[i][j] = firstMatch && dp[i + 1][j + 1]
                }
            }
        }
        return dp[0][0]
    }
    
    // recursion
    func isMatch2(_ s: String, _ p: String) -> Bool {
        let p = Array(p)
        let s = Array(s)

        func isMatching(_ i: Int, _ j: Int) -> Bool {
            if j == p.count { return i == s.count }
            let firstMatch = i < s.count && (s[i] == p[j] || p[j] == ".")
            if j + 1 < p.count && p[j + 1] == "*" {
                return isMatching(i, j + 2) || firstMatch && isMatching(i + 1, j)
            } else {
                return firstMatch && isMatching(i + 1, j + 1)
            }
        }

        return isMatching(0, 0)
    }

    func tests() {
        print(isMatch("aa", "a")) // false
        print(isMatch("aa", "a*")) // true
        print(isMatch("ab", ".*")) // true
    }
}

