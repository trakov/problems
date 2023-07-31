class LongestRepeatingCharacterReplacement {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var maxRepeatingCount = 0
        var dict = [Character: Int]() // char: count
        var result = 0
        let s = Array(s)
        var length = 0
        var start = 0
        for (i, char) in s.enumerated() {
            dict[char, default: 0] += 1
            maxRepeatingCount = max(maxRepeatingCount, dict[char]!)
            length = i - start + 1
            if length > k + maxRepeatingCount { // move start further
                let startChar = s[start]
                dict[startChar]! -= 1
                start += 1
                length -= 1
            }
            
            result = max(length, result)
        }
        
        return result
    }

    func tests() {
        print(characterReplacement("ABAB", 2)) // 4
        print(characterReplacement("AABABBA", 1)) // 4
    }
}
