final class MinimumDeletionstoMakeStringKSpecial {
    func minimumDeletions(_ word: String, _ k: Int) -> Int {
        var map: [Character: Int] = [:]
        for char in word {
            map[char, default: 0] += 1
        }
        var result = word.count
        for a in map.values {
            var deleted = 0
            for b in map.values {
                if a > b {
                    deleted += b
                } else if b > a + k {
                    deleted += b - (a + k)
                }
            }
            result = min(result, deleted)
        }
        return result
    }
    
    func tests() {
        print(minimumDeletions("aabcaba", 0)) // 3
        print(minimumDeletions("dabdcbdcdcd", 2)) // 2
        print(minimumDeletions("aaabaaa", 2)) // 1
    }
}
