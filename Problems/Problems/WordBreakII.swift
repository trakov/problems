class WordBreakII {
    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        let wordSet = Set(wordDict)
        let s = Array(s)
        var result: [String] = []
        func backtrack(_ cur: [String], _ startIndex: Int) {
            if startIndex == s.count {
                return result.append(cur.joined(separator: " "))
            }
            for endIndex in (startIndex + 1)...s.count {
                let word = String(s[startIndex..<endIndex])
                if wordSet.contains(word) {
                    backtrack(cur + [word], endIndex)
                }
            }
        }
        backtrack([], 0)
        return result
    }
    
    func tests() {
        print(wordBreak(
            "catsanddog", ["cat","cats","and","sand","dog"]
        ))
        // ["cats and dog","cat sand dog"]
        print(wordBreak(
            "pineapplepenapple", ["apple","pen","applepen","pine","pineapple"]
        ))
        // ["pine apple pen apple","pineapple pen apple","pine applepen apple"]
        print(wordBreak("catsandog", ["cats","dog","sand","and","cat"]))
        // []
    }
}

