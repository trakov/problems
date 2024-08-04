class VerifyingAnAlienDictionary {
    func isAlienSorted2(_ words: [String], _ order: String) -> Bool {
        var dict: [Character: Character] = [:]
        for (i, c) in order.enumerated() {
            dict[c] = Character(UnicodeScalar(97 + i)!)
        }
        var prevWord: String?
        for word in words {
            let newWord = word.reduce(into: "") { $0 += String(dict[$1]!) }
            if prevWord != nil {
                if newWord < prevWord! {
                    return false
                }
            }
            prevWord = newWord
        }
        return true
    }

    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        let n = words.count
        guard n > 1 else { return true }
        var map: [Character: Int] = [:]
        for (i, c) in order.enumerated() {
            map[c] = i
        }
        func isNotMore(_ s1: String, than s2: String) -> Bool {
            guard !s1.isEmpty else { return true }
            guard !s2.isEmpty else { return false }
            let s1 = Array(s1)
            let s2 = Array(s2)
            for i in 0..<min(s1.count, s2.count) where s1[i] != s2[i] {
                return map[s1[i]]! < map[s2[i]]!
            }
            return s1.count <= s2.count
        }
        for i in 1..<n {
            guard isNotMore(words[i-1], than: words[i]) else { return false }
        }
        return true
    }

    func tests() {
        print(isAlienSorted(["hello","leetcode"], "hlabcdefgijkmnopqrstuvwxyz")) // true
        print(isAlienSorted(["word","world","row"], "worldabcefghijkmnpqstuvxyz")) // false
        print(isAlienSorted(["apple","app"], "abcdefghijklmnopqrstuvwxyz")) // false
        print(isAlienSorted(["ubg","kwh"], "qcipyamwvdjtesbghlorufnkzx")) // true
    }
}
