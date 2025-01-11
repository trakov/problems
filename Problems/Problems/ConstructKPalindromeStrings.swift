class ConstructKPalindromeStrings {
    func canConstruct(_ s: String, _ k: Int) -> Bool {
        guard s.count >= k else { return false }
        guard s.count > k else { return true }
        var map: [Character: Int] = [:]
        for c in s {
            map[c, default: 0] += 1
        }
        var oddCount = 0
        for count in map.values {
            oddCount += count % 2
        }
        return oddCount <= k
    }
    
    func tests() {
        print(canConstruct("annabelle", 2)) // true
        print(canConstruct("leetcode", 3)) // false
        print(canConstruct("true", 4)) // true
    }
}

