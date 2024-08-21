class StrangePrinter {
    func strangePrinter(_ s: String) -> Int {
        var array: [Character] = [s.first!]
        for c in s.dropFirst() where array.last! != c {
            array.append(c)
        }
        let n = array.count
        guard n > 1 else { return n }
        var minTurns = Array(repeating: Array(repeating: 0, count: n), count: n)
        for i in 0..<n {
            minTurns[i][i] = 1
        }
        for length in 2...n {
            var start = 0
            while start + length - 1 < n {
                let end = start + length - 1
                minTurns[start][end] = length
                for split in 0..<length - 1 {
                    var totalTurns =
                    minTurns[start][start + split] +
                    minTurns[start + split + 1][end]
                    if array[start + split] == array[end] {
                        totalTurns -= 1
                    }
                    minTurns[start][end] = min(
                        minTurns[start][end],
                        totalTurns
                    )
                }
                start += 1
            }
        }
        return minTurns[0][n - 1]
    }
    
    func strangePrinter1(_ s: String) -> Int {
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

