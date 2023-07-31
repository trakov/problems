class ScrambleString {
    func isScramble(_ s1: String, _ s2: String) -> Bool {
        let n = s1.count
        guard n > 1 else { return s1 == s2 }
        let s1 = Array(s1)
        let s2 = Array(s2)
        var dp: [[[Int]]] = Array(
            repeating: Array(
                repeating: Array(repeating: 0, count: n), count: n),
            count: n+1
        )
        for i in 0..<n {
            for j in 0..<n {
                dp[1][i][j] = (s1[i] == s2[j] ? 1 : 0)
            }
        }
        for length in 2...n {
            for i in 0..<n + 1 - length {
                for j in 0..<n + 1 - length {
                    for newLength in 1..<length {
                        let dp1 = dp[newLength][i]
                        let dp2 = dp[length - newLength][i + newLength]
                        dp[length][i][j] |= dp1[j] & dp2[j + newLength]
                        dp[length][i][j] |= dp1[j + length - newLength] & dp2[j]
                    }
                }
            }
        }
        return dp[n][0][0] == 1
    }
    
    func tests() {
        print(isScramble("great", "rgeat")) // true
        print(isScramble("abcde", "caebd")) // false
        print(isScramble("a", "a")) // true
    }
}
