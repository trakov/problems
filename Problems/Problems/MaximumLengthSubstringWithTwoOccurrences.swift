final class MaximumLengthSubstringWithTwoOccurrences {
    func maximumLengthSubstring(_ s: String) -> Int {
        var count = Array(repeating: 0, count: 26)
        var left = 0
        var result = 0
        func index(_ c: Character) -> Int {
            Int(c.asciiValue! - Character("a").asciiValue!)
        }
        let s = Array(s)
        for right in 0..<s.count {
            let ch = index(s[right])
            count[ch] += 1
            while count[ch] > 2 {
                let ch2 = index(s[left])
                count[ch2] -= 1
                left += 1
            }
            result = max(result, right - left + 1)
        }
        return result
    }
    
    func tests() {
        print(maximumLengthSubstring("bcbbbcba")) // 4
        print(maximumLengthSubstring("aaaa")) // 2
    }
}
