final class LongestSubsequenceRepeatedkTimes {
    func longestSubsequenceRepeatedK(_ s: String, _ k: Int) -> String {
        func isKRepeatedSubsequence(_ t: String) -> Bool {
            let t = Array(t)
            var (pos, matched) = (0, 0)
            let m = t.count
            for c in s {
                if c == t[pos] {
                    pos += 1
                    if pos == m {
                        pos = 0
                        matched += 1
                        if matched == k {
                            return true
                        }
                    }
                }
            }
            return false
        }
        var freq = Array(repeating: 0, count: 26)
        let a = Int(Character("a").asciiValue!)
        for c in s {
            freq[Int(c.asciiValue!) - a] += 1
        }
        var candidate: [Character] = []
        for i in (0...25).reversed() {
            if freq[i] >= k {
                candidate.append(Character(UnicodeScalar(a + i)!))
            }
        }
        var q: [String] = []
        for c in candidate {
            q.append(String(c))
        }
        var result = ""
        while !q.isEmpty {
            let curr = q.removeFirst()
            if curr.count > result.count {
                result = curr
            }
            for c in candidate {
                let next = curr + String(c)
                if isKRepeatedSubsequence(next) {
                    q.append(next)
                }
            }
        }
        return result
    }
    
    func tests() {
        print(longestSubsequenceRepeatedK("letsleetcode", 2)) // "let"
        print(longestSubsequenceRepeatedK("bb", 2)) // b
        print(longestSubsequenceRepeatedK("ab", 2)) // ""
    }
}
