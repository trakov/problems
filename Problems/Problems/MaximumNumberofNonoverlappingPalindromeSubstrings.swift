final class MaximumNumberofNonoverlappingPalindromeSubstrings {
    func maxPalindromes(_ s: String, _ k: Int) -> Int {
        let s = Array(s)
        let n = s.count
        var result = 0
        var start = 0
        func check(_ l: Int, _ r: Int) -> Bool {
            while l < r {
                if s[l] != s[r] {
                    return false
                }
                return check(l + 1, r - 1)
            }
            return true
        }
        for r in k-1..<n {
            var l = r - k + 1
            if l >= start && check(l, r) {
                result += 1
                start = r + 1
                continue
            }
            l = r - k
            if l >= start && check(l, r) {
                result += 1
                start = r + 1
            }
        }
        return result
    }
    
    func tests() {
        print(maxPalindromes("abaccdbbd", 3)) // 2
        print(maxPalindromes("adbcda", 2)) // 0
    }
}
