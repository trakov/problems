final class FindtheOriginalTypedStringII {
    func possibleStringCount(_ word: String, _ k: Int) -> Int {
        let mod = 1_000_000_007
        let n = word.count
        guard n >= k else { return 0 }
        guard n > 1 else { return 1 }
        var count = 1
        let word = Array(word)
        var freq: [Int] = []
        for (i, w) in (word + "*").enumerated().dropFirst() {
            if w == word[i - 1] {
                count += 1
            } else {
                freq.append(count)
                count = 1
            }
        }
        var result = 1
        for f in freq {
            result = (result * f) % mod
        }
        if freq.count >= k {
            return result
        }
        var f = Array(repeating: 0, count: k)
        var g = Array(repeating: 1, count: k)
        f[0] = 1
        for fr in freq {
            var f_new = Array(repeating: 0, count: k)
            for j in 1..<k {
                f_new[j] = g[j - 1]
                if j - fr - 1 >= 0 {
                    f_new[j] = (f_new[j] - g[j - fr - 1] + mod) % mod
                }
            }
            var g_new = Array(repeating: 0, count: k)
            g_new[0] = f_new[0]
            for j in 1..<k {
                g_new[j] = (g_new[j - 1] + f_new[j]) % mod
            }
            f = f_new
            g = g_new
        }
        return (result - g[k - 1] + mod) % mod
    }
    
    func tests() {
        print(possibleStringCount("aabbccdd", 7)) // 5
        print(possibleStringCount("aabbccdd", 8)) // 1
        print(possibleStringCount("aaabbb", 3)) // 8
    }
}
