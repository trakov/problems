class IsomorphicStrings {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        var s2t: [Character: Character] = [:]
        var t2s: [Character: Character] = [:]
        for (c, d) in zip(s, t) {
            if let value = s2t[c], value != d { return false }
            if let value = t2s[d], value != c { return false }
            s2t[c] = d
            t2s[d] = c
        }
        return true
    }
    
    func isIsomorphic2(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else {
            return false
        }
        
        var sToT = [Character: Character]()
        var tToS = [Character: Character]()
        var index = s.startIndex
        while index != s.endIndex {
            let charS = s[index]
            let charT = t[index]
            if let old = sToT.updateValue(charT, forKey: charS) {
                if old != charT {
                    return false
                }
            }
            if let old = tToS.updateValue(charS, forKey: charT) {
                if old != charS {
                    return false
                }
            }
            index = s.index(after: index)
        }
        return true
    }
    
    func tests() {
        var s, t: String
        s = "egg"; t = "add"
        print(isIsomorphic(s, t)) // true
        s = "foo"; t = "bar"
        print(isIsomorphic(s, t)) // false
        s = "paper"; t = "title"
        print(isIsomorphic(s, t)) // true
        s = "bar"; t = "foo"
        print(isIsomorphic(s, t)) // false

    }
}
