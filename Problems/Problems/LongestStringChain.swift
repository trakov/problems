class LongestStringChain {
    func longestStrChain(_ words: [String]) -> Int {
        var dp: [String: Int] = [:]
        var words = words.sorted(by: { $0.count < $1.count })
        var result = 1
        for word in words {
            var presentLength = 1
            for i in 0 ..< word.count {
                var newStr = Array(word)
                newStr.remove(at: i)
                let prevL = dp[String(newStr), default: 0]
                presentLength = max(prevL + 1, presentLength)
            }
            dp[word] = presentLength
            result = max(presentLength, result)
        }
        return result
    }
    
    func tests() {
        print(longestStrChain(["a","b","ba","bca","bda","bdca"])) // 4
        print(longestStrChain(["xbc","pcxbcf","xb","cxbc","pcxbc"])) // 5
        print(longestStrChain(["abcd","dbqca"])) // 1
    }
}

