final class SmallestPalindromicRearrangementII {
    func smallestPalindrome(_ s: String, _ k: Int) -> String {
        func comb(_ n: Int, _ m: Int, _ k: Int) -> Int {
            var res = 1
            let m = min(m, n - m)
            guard m > 0 else { return res }
            for i in 1...m {
                res = (res * (n - i + 1)) / i
                if res > k { return k + 1 }
            }
            return res
        }
        func permutations(_ rem: Int, _ bucket: [Int], _ k: Int) -> Int {
            var (ways, rem) = (1, rem)
            for b in bucket {
                if b == 0 { continue }
                ways *= comb(rem, b, k);
                if ways > k { break }
                rem -= b
            }
            return ways
        }
        let partition = s.count / 2
        guard partition > 1 else {
            return k == 1 ? s : ""
        }
        var bucket = Array(repeating: 0, count: 26)
        for c in s.prefix(partition) {
            bucket[Int(c.asciiValue!) - 97] += 1
        }
        var left: [Character] = []
        var startIndex = 1
        let s = Array(s)
        for pos in 0..<partition {
            for i in 0..<26 {
                if bucket[i] == 0 { continue }
                bucket[i] -= 1
                let ways = permutations(partition - pos - 1, bucket, k)
                if startIndex + ways > k {
                    left.append(Character(UnicodeScalar(i + 97)!))
                    break
                }
                bucket[i] += 1
                startIndex += ways
            }
        }
        if left.count < partition { return "" }
        if s.count % 2 != 0 {
            left.append(s[partition])
        }
        for i in (0...partition-1).reversed() {
            left.append(left[i])
        }
        return String(left)
    }

    func tests() {
        print(smallestPalindrome("abba", 2)) // "baab"
        print(smallestPalindrome("aa", 2)) // ""
        print(smallestPalindrome("bacab", 1)) // abcba"
        print(smallestPalindrome("o", 1)) // "o"
    }
}
