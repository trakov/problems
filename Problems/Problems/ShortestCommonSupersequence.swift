class ShortestCommonSupersequence {
    func shortestCommonSupersequence(_ str1: String, _ str2: String) -> String {
        let str1 = Array(str1)
        let str2 = Array(str2)
        let (n, m) = (str1.count, str2.count)
        var dp = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
        for i in 0...n {
            dp[i][0] = i
        }
        for j in 0...m {
            dp[0][j] = j
        }
        for i in 1...n {
            for j in 1...m {
                if str1[i - 1] == str2[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                } else {
                    dp[i][j] = min(dp[i - 1][j], dp[i][j - 1]) + 1
                }
            }
        }
        var result = ""
        var (i, j) = (n, m)
        while i > 0, j > 0 {
            if str1[i - 1] == str2[j - 1] {
                result.append(str1[i - 1])
                i -= 1
                j -= 1
            } else if dp[i - 1][j] < dp[i][j - 1] {
                result.append(str1[i - 1])
                i -= 1
            } else {
                result.append(str2[j - 1])
                j -= 1
            }
        }
        while i > 0 {
            result.append(str1[i - 1])
            i -= 1
        }
        while j > 0 {
            result.append(str2[j - 1])
            j -= 1
        }
        return String(result.reversed())
    }
    
    func tests() {
        print(shortestCommonSupersequence("abac", "cab")) // "cabac"
        print(shortestCommonSupersequence("aaaaaaaa", "aaaaaaaa")) // "aaaaaaaa"
    }
}
