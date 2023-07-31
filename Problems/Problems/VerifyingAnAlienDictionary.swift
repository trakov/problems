class VerifyingAnAlienDictionary {
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
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

    func tests() {
        print(isAlienSorted(["hello","leetcode"], "hlabcdefgijkmnopqrstuvwxyz")) // true
        print(isAlienSorted(["word","world","row"], "worldabcefghijkmnpqstuvxyz")) // false
        print(isAlienSorted(["apple","app"], "abcdefghijklmnopqrstuvwxyz")) // false
    }
}
