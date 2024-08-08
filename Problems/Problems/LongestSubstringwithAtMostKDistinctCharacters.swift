class LongestSubstringwithAtMostKDistinctCharacters {
    func longestSubstringLength(_ s: String, _ k: Int) -> Int {
        guard k > 0 else { return 0 }
        guard s.count > 1 else { return 1 }
        let s = Array(s)
        var map: [Character: Int] = [:]
        var result = 0
        var left = 0
        for (right, c) in s.enumerated() {
            map[c, default: 0] += 1
            while map.count > k {
                guard let leftCount = map[s[left]] else { fatalError() }
                map[s[left]] = leftCount == 1 ? nil : leftCount - 1
                left += 1
            }
            result = max(result, right - left + 1)
        }
        
        return result
    }
    
    func tests() {
        print(longestSubstringLength("eceba", 2)) // 3
        print(longestSubstringLength("aa", 1)) // 2
    }
}

