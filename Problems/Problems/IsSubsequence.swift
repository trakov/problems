class IsSubsequence {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
	    guard !s.isEmpty else { return true }
	    guard t.count >= s.count else { return false }
	    let s = Array(s)
	    let t = Array(t)
	    var i = 0
	    var j = 0
	    while i < s.count && j < t.count {
    	    if s[i] == t[j] {
	    	    i += 1
	    	    j += 1
	    	    if i == s.count {
    	    	    return true
	    	    }
    	    } else {
	    	    j += 1
    	    }
	    }
	    return false
    }

    func isSubsequence2(_ s: String, _ t: String) -> Bool {
        guard s.count > 0 else { return true }
        guard s.count <= t.count else { return false }
        var tempT = t
        for c in s {
            if let index = tempT.firstIndex(of: c) {
                tempT = String(tempT.suffix(from: tempT.index(after: index)))
            } else {
                return false
            }
        }
        return true
    }

    func tests() {
        print(isSubsequence("aaaaaa", "bbaaaa")) // false
        print(isSubsequence("abc", "ahbgdc")) // true
        print(isSubsequence("axc", "ahbgdc")) // false
        print(isSubsequence("", "ahbgdc")) // true
        print(isSubsequence("a", "ahbgdc")) // true
        print(isSubsequence("z", "ahbgdc")) // false
    }
}
