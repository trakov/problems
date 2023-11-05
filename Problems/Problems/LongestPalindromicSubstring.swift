class LongestPalindromicSubstring {
    func longestPalindrome(_ s: String) -> String {
        let n = s.count
        guard n > 1 else { return s }
        let s = Array(s)
        func lr(_ i: Int, _ j: Int) -> (Int, Int) {
            var l = i
            var r = j
            while l >= 0, r < n, s[l] == s[r] {
                l -= 1
                r += 1
            }
            return (l + 1, r - 1)
        }
        var left = 0
        var right = 0
        for i in 0..<n {
            var (l, r) = lr(i, i)
            if r - l > right - left {
                right = r
                left = l
            }
            (l, r) = lr(i, i + 1)
            if r - l > right - left {
                right = r
                left = l
            }
        }
        return String(s[left...right])
    }
    
    func longestPalindrome0(_ s: String) -> String {
        guard s.count > 1 else { return s }
        let s = Array(s)
        func expand(_ i: Int, _ j: Int) -> Int {
            var left = i
            var right = j
            while left >= 0 && right < s.count && s[left] == s[right] {
                left -= 1
                right += 1
            }
            return right - left - 1
        }
        var left = 0
        var right = 0
        for i in 0..<s.count {
            let oddLength = expand(i, i)
            if oddLength > right - left + 1 {
                let dist = oddLength / 2
                left = i - dist
                right = i + dist
            }
            
            let evenLength = expand(i, i + 1)
            if evenLength > right - left + 1 {
                let dist = (evenLength / 2) - 1
                left = i - dist;
                right = i + 1 + dist
            }
        }
        return String(s[left...right])
    }
    
    func longestPalindrome2(_ s: String) -> String {
        guard s.count > 1 else { return s }
        let s = Array(s)
        var left = 0
        var right = 0
        var dp = Array(repeating: Array(repeating: false, count: s.count), count: s.count)
        for i in 1..<s.count {
            for j in 0..<i {
                guard s[j] == s[i] && (dp[j+1][i-1] || i - j <= 2) else { continue }
                dp[j][i] = true
                if i - j > right - left {
                    left = j
                    right = i
                }
            }
        }
        return String(s[left...right])
    }
    
    func tests() {
        print(longestPalindrome("babad")) // bab // aba
        print(longestPalindrome("cbbd")) // bb
    }
}
