class WordBreak {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var dp = [Bool](repeating: false, count: s.count + 1)
        dp[0] = true
        let s = Array(s)
        let wordSet = Set(wordDict)
        for i in 1...s.count {
            for j in 0..<i {
                guard dp[j], wordSet.contains(String(s[j..<i])) else { continue }
                dp[i] = true
                break
            }
        }
        return dp[s.count]
    }

    func tests() {
        print(wordBreak("aaaaaaa", ["aaaa","aa"])) // false
        print(wordBreak("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab",["a","aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa"])) // false
        print(wordBreak("leetcode", ["leet","code"])) // true
        print(wordBreak("applepenapple", ["apple","pen"])) // true
        print(wordBreak("catsandog", ["cats","dog","sand","and","cat"])) // false
    }
}
