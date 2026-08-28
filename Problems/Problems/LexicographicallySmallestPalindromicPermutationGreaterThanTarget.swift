final class LexicographicallySmallestPalindromicPermutationGreaterThanTarget {
    func lexPalindromicPermutation(_ s: String, _ target: String) -> String {
        let n = s.count
        if n == 1 {
            return s.first! > target.first! ? s : ""
        }
        let target = Array(target.utf8)
        let s = Array(s.utf8)
        var cnt = Array(repeating: 0, count: 26)
        for c in s {
            cnt[Int(c - 97)] += 1
        }
        var oddChar: UInt8?
        for i in 0..<26 {
            if cnt[i] % 2 == 1 {
                if oddChar != nil {
                    return ""
                }
                oddChar = UInt8(i + 97)
            }
            cnt[i] /= 2
        }
        func check(_ prefix: [UInt8], _ c: UInt8, _ cnt: [Int]) -> Bool {
            var left = prefix
            left.append(c)
            for i in stride(from: 25, through: 0, by: -1) {
                left += repeatElement(UInt8(i + 97), count: cnt[i])
            }
            var palindrome = left
            if let oddChar {
                palindrome.append(oddChar)
            }
            palindrome += left.reversed()
            return target.lexicographicallyPrecedes(palindrome)
        }
        var prefix: [UInt8] = []
        for i in 0..<(n / 2) {
            var found = false
            for j in 0..<26 where cnt[j] > 0 {
                cnt[j] -= 1
                if check(prefix, UInt8(j + 97), cnt) {
                    prefix.append(UInt8(j + 97))
                    found = true
                    break
                }
                cnt[j] += 1
            }
            if !found {
                return ""
            }
            if prefix[i] > target[i] {
                var left = prefix
                for j in 0..<26 {
                    left += repeatElement(UInt8(j + 97), count: cnt[j])
                }
                var result = left
                if let oddChar {
                    result.append(oddChar)
                }
                result += left.reversed()
                return String(bytes: result, encoding: .utf8)!
            }
        }
        var result = prefix
        if let oddChar {
            result.append(oddChar)
        }
        result += prefix.reversed()
        return String(bytes: result, encoding: .utf8)!
    }

    func tests() {
        print(lexPalindromicPermutation("baba", "abba")) // "baab"
        print(lexPalindromicPermutation("baba", "bbaa")) // ""
        print(lexPalindromicPermutation("abc", "abb")) // ""
        print(lexPalindromicPermutation("aac", "abb")) // "aca"
    }
}
