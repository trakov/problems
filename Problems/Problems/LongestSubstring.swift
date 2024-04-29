class LongestSubstring {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var result = 0
        var map: [Character: Int] = [:]
        var left = 0
        for (i, c) in s.enumerated() {
            if let j = map[c] {
                left = max(left, j + 1)
            }
            result = max(result, i - left + 1)
            map[c] = i
        }
        return result
    }

    func tests() {
        print(lengthOfLongestSubstring("abcabcbb")) // 3
        print(lengthOfLongestSubstring("bbbbb")) // 1
        print(lengthOfLongestSubstring("pwwkew")) // 3
        print(lengthOfLongestSubstring("dvdf")) // 3
    }
}
