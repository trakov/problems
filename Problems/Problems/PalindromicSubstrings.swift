class PalindromicSubstrings {
    func countSubstrings(_ s: String) -> Int {
        let s = Array(s)
        func countPalindromeFromCenter(_ left: Int, _ right: Int) -> Int {
            var l = left, r = right
            var count = 0
            while l >= 0 && r < s.count {
                if s[l] == s[r] {
                    count += 1
                    l -= 1
                    r += 1
                } else {
                    return count
                }
            }
            return count
        }
        var count = 0
        for i in 0..<s.count {
            count += countPalindromeFromCenter(i, i)
            count += countPalindromeFromCenter(i, i + 1)
        }
        return count
    }
    
    func countSubstrings2(_ s: String) -> Int {
        let n = s.count
        let s = Array(s)
        var dp = Array(repeating: Array(repeating: false, count: n), count: n)
        var result = 0
        for len in 1...n {
            for i in 0..<n - len + 1 {
                if (s[i] == s[i + len - 1] && (len <= 2 || dp[i + 1][i + len - 2])) {
                    dp[i][i + len - 1] = true
                    result += 1
                }
            }
        }
        return result
    }
    
    func tests() {
        print(countSubstrings("abc")) // 3
        print(countSubstrings("aaa")) // 6
    }
}

