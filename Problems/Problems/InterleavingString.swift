class InterleavingString {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        let n = s1.count
        let m = s2.count
        guard n + m == s3.count else { return false }
        let s1 = Array(s1)
        let s2 = Array(s2)
        let s3 = Array(s3)
        var dp = Array(repeating: Array(repeating: false, count: m+1), count: n+1)
        dp[0][0] = true
        for i in 0...n {
            for j in 0...m {
                if i < n, s1[i] == s3[i + j], dp[i][j] {
                    dp[i + 1][j] = true
                }
                if j < m, s2[j] == s3[i + j], dp[i][j] {
                    dp[i][j + 1] = true
                }
            }
        }
        return dp.last!.last!
    }

    func isInterleave2(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        guard s1.count + s2.count == s3.count else { return false }
        let s1 = Array(s1)
        let s2 = Array(s2)
        let s3 = Array(s3)
        func key(_ i: Int, _ j: Int) -> Int {
            i * 100 + j
        }
        var map: [Int: Bool] = [:]
        func dfs(_ i1: Int, _ i2: Int, _ i3: Int) -> Bool {
            if i3 == s3.count { return true }
            if let val = map[key(i1, i2)] { return val }
            let isFirst = i1 < s1.count && s1[i1] == s3[i3]
            let isSecond = i2 < s2.count && s2[i2] == s3[i3]
            var result = false
            if isFirst {
                result = result || dfs(i1 + 1, i2, i3 + 1)
            }
            if isSecond {
                result = result || dfs(i1, i2 + 1, i3 + 1)
            }
            map[key(i1, i2)] = result
            return result
        }
        return dfs(0, 0, 0)
    }
    
    func tests() {
        print(isInterleave("aabcc", "dbbca", "aadbbcbcac")) // true
        print(isInterleave("aabcc", "dbbca", "aadbbbaccc")) // false
        print(isInterleave("", "", "")) // true
        print(isInterleave(
            "bbbbbabbbbabaababaaaabbababbaaabbabbaaabaaaaababbbababbbbbabbbbababbabaabababbbaabababababbbaaababaa",
            "babaaaabbababbbabbbbaabaabbaabbbbaabaaabaababaaaabaaabbaaabaaaabaabaabbbbbbbbbbbabaaabbababbabbabaab",
            "babbbabbbaaabbababbbbababaabbabaabaaabbbbabbbaaabbbaaaaabbbbaabbaaabababbaaaaaabababbababaababbababbbababbbbaaaabaabbabbaaaaabbabbaaaabbbaabaaabaababaababbaaabbbbbabbbbaabbabaabbbbabaaabbababbabbabbab"
        )) // false
    }
}

