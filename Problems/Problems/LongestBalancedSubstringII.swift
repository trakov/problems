final class LongestBalancedSubstringII {
    func longestBalanced(_ s: String) -> Int {
        let s = Array(s)
        let n = s.count
        var (cur_a, cur_b, cur_c) = (0, 0, 0)
        var (max_a, max_b, max_c) = (0, 0, 0)
        for (i, c) in s.enumerated() {
            if c == "a" {
                cur_a = (i > 0 && s[i-1] == "a") ? cur_a + 1 : 1
                max_a = max(max_a, cur_a)
            } else if c == "b" {
                cur_b = (i > 0 && s[i-1] == "b") ? cur_b + 1 : 1
                max_b = max(max_b, cur_b)
            } else {
                cur_c = (i > 0 && s[i-1] == "c") ? cur_c + 1 : 1
                max_c = max(max_c, cur_c)
            }
        }
        func find2(_ x: Character, _ y: Character) -> Int {
            var result = 0
            var first = Array(repeating: -2, count: 2 * n + 1)
            var (clear_idx, diff) = (-1, n)
            first[diff] = -1
            for (i, c) in s.enumerated() {
                if c != x && c != y {
                    clear_idx = i
                    diff = n
                    first[diff] = clear_idx
                } else {
                    diff += c == x ? 1 : -1
                    if first[diff] < clear_idx {
                        first[diff] = i
                    } else {
                        result = max(result, i - first[diff])
                    }
                }
            }
            return result
        }
        func find3() -> Int {
            var state = Int.max / 2
            var first: [Int: Int] = [:]
            first[state] = -1
            var result = 0
            for (i, c) in s.enumerated() {
                if c == "a" {
                    state += 1_000_001
                } else if c == "b" {
                    state -= 1_000_000
                } else {
                    state -= 1
                }
                if let val = first[state] {
                    result = max(result, i - val)
                } else {
                    first[state] = i
                }
            }
            return result
        }
        return max(
            max_a, max_b, max_c,
            find2("a", "b"),
            find2("a", "c"),
            find2("c", "b"),
            find3()
        )
    }

    func tests() {
        print(longestBalanced("abbac")) // 4
        print(longestBalanced("aabcc")) // 3
        print(longestBalanced("aba")) // 2
    }
}
