class IsSubsequence {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
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
