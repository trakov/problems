final class CounttheNumberofSpecialCharactersII {
    func numberOfSpecialChars(_ word: String) -> Int {
        let n = word.count
        var map: [Character: (lastLowerIndex: Int?, firstUpperIndex: Int?)] = [:]
        for (i, c) in word.enumerated() {
            let key = Character(c.lowercased())
            var (l, u) = map[key] ?? (nil, nil)
            if c.isLowercase {
                l = (u == nil) ? i : n
            } else if u == nil {
                u = i
            }
            map[key] = (l, u)
        }
        return map.values.count { (lower, upper) in
            guard let lower, let upper else { return false }
            return lower < upper
        }
    }
    
    func tests() {
        print(numberOfSpecialChars("aaAbcBC")) // 3
        print(numberOfSpecialChars("abc")) // 0
        print(numberOfSpecialChars("AbBCab")) // 0
    }
}
