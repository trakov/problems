final class SmallestPalindromicRearrangementI {
    func smallestPalindrome(_ s: String) -> String {
        var map: [Character: Int] = [:]
        for c in s {
            map[c, default: 0] += 1
        }
        var result = Array(s)
        let n = s.count
        var (l, r) = (0, n - 1)
        for c in "abcdefghijklmnopqrstuvwxyz" {
            guard let count = map[c] else { continue }
            for _ in 0..<count / 2 {
                result[l] = c
                result[r] = c
                l += 1
                r -= 1
            }
            if count % 2 == 1 {
                result[n/2] = c
            }
        }
        return String(result)
    }

    func tests() {
        print(smallestPalindrome("z")) // "z"
        print(smallestPalindrome("babab")) // "abbba"
        print(smallestPalindrome("daccad")) // "acddca"
    }
}
