class IsomorphicStrings {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        var ds: [Character: [Int]] = [:]
        var s = Array(s)
        for (i, c) in s.enumerated() {
            ds[c, default: []] += [i]
        }
        
        var dt: [Character: [Int]] = [:]
        var t = Array(t)
        for (i, c) in t.enumerated() {
            dt[c, default: []] += [i]
        }

        return dt.values.sorted(by: {$0[0] < $1[0]}) == ds.values.sorted(by: {$0[0] < $1[0]})
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
