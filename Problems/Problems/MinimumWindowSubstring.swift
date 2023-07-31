class MinimumWindowSubstring {
    func minWindow(_ s: String, _ t: String) -> String {
        guard s.count >= t.count else { return "" }
        var s = Array(s)
        var map: [Character: Int] = [:]
        for c in t {
            map[c, default: 0] += 1
        }
        let chars = Set(map.keys)
        var output: (lower: Int, upper: Int)?
        var lower = 0
        for upper in s.indices {
            guard chars.contains(s[upper]) else { continue }
            map[s[upper], default: 0] -= 1
            while map.values.allSatisfy { $0 <= 0 } {
                if output == nil || upper-lower < output!.upper-output!.lower {
                    output = (lower, upper)
                }
                if chars.contains(s[lower]) {
                    map[s[lower], default: 0] += 1
                }
                lower += 1
            }
        }
        if let output = output {
            return String(s[output.lower...output.upper])
        } else {
            return ""
        }
    }

    func tests() {
        print(minWindow("ADOBECODEBANC", "ABC")) // BANC
        print(minWindow("a", "a")) // a
        print(minWindow("a", "aa")) // ""
    }
}
