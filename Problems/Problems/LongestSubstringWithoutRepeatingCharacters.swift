class LongestSubstringWithoutRepeatingCharacters {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var map: [Character: Int] = [:]
        var result = 0
        var left = 0
        for (i, c) in s.enumerated() {
            if (map[c] == nil || map[c]! < left) {
                result = max(result, i - left + 1)
            } else {
                left = map[c]! + 1
            }
            map[c] = i
        }
        return result
    }

    func lengthOfLongestSubstring2(_ s: String) -> Int {
        guard s.count > 1 else { return s.count }
        let s = Array(s)
        var maxLength = 0
        var i = 0
        while i < s.count {
            let c = s[i]
            var set: Set<Character> = [c]
            for j in i+1..<s.count {
                if !set.insert(s[j]).inserted {
                    break
                }
            }
            maxLength = max(maxLength, set.count)
//            if s.count - 1 - (set.count + i) <= maxLength {
//                return maxLength
//            }
            if maxLength == s.count - i {
                return maxLength
            }
            i += 1
        }
        
        return maxLength
    }
    
    func tests() {
        print(lengthOfLongestSubstring("abba")) // 2
        print(lengthOfLongestSubstring("abcabcbb")) // 3
        print(lengthOfLongestSubstring("bbbbb")) // 1
        print(lengthOfLongestSubstring("pwwkew")) // 3
        print(lengthOfLongestSubstring("ab")) // 2
        print(lengthOfLongestSubstring("dvdf")) // 3
    }
}
