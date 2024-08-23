class WildcardMatching {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let n = s.count
        let m = p.count
        let s = Array(s)
        let p = Array(p)
        var (i, j) = (0, 0)
        var (starIdx, sTmpIdx) = (-1, -1)
        while i < n {
            if j < m && (p[j] == "?" || p[j] == s[i]) {
                i += 1
                j += 1
            } else if j < m && p[j] == "*" {
                starIdx = j
                sTmpIdx = i
                j += 1
            } else if starIdx > -1 {
                j = starIdx + 1
                sTmpIdx += 1
                i = sTmpIdx
            } else {
                return false
            }
        }
        for i in j..<m where p[i] != "*" {
            return false
        }
        return true
    }
    
    func tests() {
        print(isMatch("aa", "a")) // false
        print(isMatch("aa", "*")) // true
        print(isMatch("cb", "?a")) // false
    }
}

