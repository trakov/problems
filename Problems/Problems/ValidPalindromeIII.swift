class ValidPalindromeIII {
    func isValidPalindrome(_ s: String, _ k: Int) -> Bool {
        let n = s.count
        guard k < n - 1 else { return true }
        let s = Array(s)
        var memo = Array(repeating: Array(repeating: -1, count: n), count: n)
        func dfs(_ left: Int, _ right: Int) -> Int {
            if memo[left][right] != -1 {
                return memo[left][right]
            }
            if left == right { return 0 }
            if left == right - 1 {
                return s[left] == s[right] ? 0 : 1
            }
            if s[left] == s[right] {
                let val = dfs(left + 1, right - 1)
                memo[left][right] = val
            } else {
                let val1 = dfs(left, right - 1)
                let val2 = dfs(left + 1, right)
                memo[left][right] = min(val1, val2) + 1
            }
            return memo[left][right]
        }
        return dfs(0, n - 1) <= k
    }
    
    func tests() {
        print(isValidPalindrome("abcdeca", 2)) // true
        print(isValidPalindrome("abbababa", 1)) // true
        print(isValidPalindrome("baaaabaa", 3)) // true
        print(isValidPalindrome("fcgihcgeadfehgiabegbiahbeadbiafgcfchbcacedbificicihibaeehbffeidiaiighceegbfdggggcfaiibefbgeegbcgeadcfdfegfghebcfceiabiagehhibiheddbcgdebdcfegaiahibcfhheggbheebfdahgcfcahafecfehgcgdabbghddeadecidicchfgicbdbecibddfcgbiadiffcifiggigdeedbiiihfgehhdegcaffaggiidiifgfigfiaiicadceefbhicfhbcachacaeiefdcchegfbifhaeafdehicfgbecahidgdagigbhiffhcccdhfdbd", 216)) // true
    }
}

