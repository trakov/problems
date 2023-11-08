class MinimumWindowSubstring {
    func minWindow(_ s: String, _ t: String) -> String {
        guard s.count >= t.count else { return "" }
        let s = Array(s)
        var map: [Character: Int] = [:]
        for c in t {
            map[c, default: 0] += 1
        }
        let chars = Set(map.keys)
        var left = 0
        var length = Int.max
        var i = 0
        for (j, c) in s.enumerated() where chars.contains(c) {
            map[c, default: 0] -= 1
            while map.values.allSatisfy({ $0 <= 0 }) {
                if j - i + 1 < length {
                    length = j - i + 1
                    left = i
                }
                if chars.contains(s[i]) {
                    map[s[i], default: 0] += 1
                }
                i += 1
            }
        }
        guard length != Int.max else { return "" }
        return String(s[left...(left + length - 1)])
    }

    func tests() {
        print(minWindow("ADOBECODEBANC", "ABC")) // BANC
        print(minWindow("a", "a")) // a
        print(minWindow("a", "aa")) // ""
    }
}
