class StrangePrinter {
    func strangePrinter(_ s: String) -> Int {
        let n = s.count
        let s = Array(s)
        var dp = Array(repeating: Array(repeating: -1, count: n), count: n)
        
        func solve(_ left: Int, _ right: Int) -> Int {
            if dp[left][right] != -1 { return dp[left][right] }
            dp[left][right] = n
            var j = -1
            
            for i in left..<right {
                if s[i] != s[right] && j == -1 {
                    j = i
                }
                guard j != -1 else { continue }
                dp[left][right] = min(
                    dp[left][right],
                    1 + solve(j, i) + solve(i + 1, right)
                )
            }
            if j == -1 {
                dp[left][right] = 0
            }
            return dp[left][right]
        }
        return solve(0, n - 1) + 1
    }
    
    func tests() {
        print(strangePrinter("aaabbb")) // 2
        print(strangePrinter("aba")) // 2
    }
}

