class ExtraCharactersInAString {
    func minExtraChar(_ s: String, _ dictionary: [String]) -> Int {
        let n = s.count
        var dp = Array(repeating: n, count: n + 1)
        dp[0] = 0
        let s = Array(s)
        let wordSet = Set(dictionary)
        for i in 1...n {
            for j in 0..<i {
                let word = String(s[j..<i])
                if wordSet.contains(word) {
                    dp[i] = dp[j]
                } else {
                    dp[i] = min(dp[i], dp[j] + i - j)
                }
            }
        }
        return dp[s.count]
    }
    
    func tests() {
        print(minExtraChar("leetscode", ["leet","code","leetcode"])) // 1
        print(minExtraChar("sayhelloworld", ["hello","world"])) // 3
    }
}

