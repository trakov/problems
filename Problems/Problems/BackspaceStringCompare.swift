class BackspaceStringCompare {
    func backspaceCompare(_ s: String, _ t: String) -> Bool {
        var i = s.endIndex
        var sIgnoreCount = 0
        var j = t.endIndex
        var tIgnoreCount = 0
        var cs: Character?
        var ct: Character?
        while i >= s.startIndex || j >= t.startIndex {
            if cs != nil && ct != nil {
                if cs != ct {
                    return false
                }
                cs = nil
                ct = nil
            }
            if cs == nil {
                i = s.index(before: i)
                if s[i] == "#" {
                    sIgnoreCount += 1
                } else {
                    if sIgnoreCount > 0 {
                        sIgnoreCount -= 1
                    } else {
                        cs = s[i]
                    }
                }
            }
            if ct == nil {
                j = t.index(before: j)
                if t[i] == "#" {
                    tIgnoreCount += 1
                } else {
                    if tIgnoreCount > 0 {
                        tIgnoreCount -= 1
                    } else {
                        ct = t[i]
                    }
                }
            }
        }
        if i != s.startIndex {
            return s.prefix(upTo: i).replacingOccurrences(of: "#", with: "").isEmpty
        }
        if j != t.startIndex {
            return t.prefix(upTo: j).replacingOccurrences(of: "#", with: "").isEmpty
        }
        return true
    }

    func backspaceCompare2(_ s: String, _ t: String) -> Bool {
        var s1: [Character] = []
        var t1: [Character] = []
        for c in s {
            if c != "#" {
                s1.append(c)
            } else if !s1.isEmpty {
                s1.removeLast()
            }
        }
        for c in t {
            if c != "#" {
                t1.append(c)
            } else if !t1.isEmpty {
                t1.removeLast()
            }
        }
        return t1 == s1
    }

    func tests() {
        print(backspaceCompare("ab#c", "ad#c")) // "ac"
        print(backspaceCompare("ab##", "c#d#")) // ""
        print(backspaceCompare("a#c", "b")) // false
        print(backspaceCompare("y#fo##f", "y#f#o##f")) //
    }
}
