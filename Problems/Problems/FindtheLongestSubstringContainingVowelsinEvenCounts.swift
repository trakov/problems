class FindtheLongestSubstringContainingVowelsinEvenCounts {
    private func index(of c: Character) -> Int {
        Int(c.asciiValue! - Character("a").asciiValue!)
    }
    func findTheLongestSubstring(_ s: String) -> Int {
        var prefixXOR = 0
        var characterMap = Array(repeating: 0, count: 26)
        characterMap[index(of: "a")] = 1
        characterMap[index(of: "e")] = 2
        characterMap[index(of: "i")] = 4
        characterMap[index(of: "o")] = 8
        characterMap[index(of: "u")] = 16
        var mp = Array(repeating: -1, count: 32)
        var result = 0
        for (i, c) in s.enumerated() {
            prefixXOR ^= characterMap[index(of: c)]
            if mp[prefixXOR] == -1 && prefixXOR != 0 {
                mp[prefixXOR] = i
            }
            result = max(result, i - mp[prefixXOR])
        }
        return result
    }
    
    func tests() {
        print(findTheLongestSubstring("eleetminicoworoep")) // 13
        print(findTheLongestSubstring("leetcodeisgreat")) // 5
        print(findTheLongestSubstring("bcbcbc")) // 6
    }
}

