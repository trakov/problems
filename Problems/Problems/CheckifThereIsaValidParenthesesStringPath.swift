final class CheckifThereIsaValidParenthesesStringPath {
    func hasValidPath(_ grid: [[Character]]) -> Bool {
        let (n, m) = (grid.count, grid[0].count)
        let pathLen = n + m - 1
        guard pathLen % 2 == 0 else { return false }
        guard grid[0][0] == "(" && grid[n - 1][m - 1] == ")" else { return false }
        var dp = Array(repeating: Array(repeating: Array(repeating: false, count: pathLen + 1), count: m), count: n)
        dp[0][0][1] = true
        for (i, row) in grid.enumerated() {
            for (j, c) in row.enumerated() {
                let change = c == "(" ? 1 : -1
                if i > 0 {
                    for balance in 0...pathLen where dp[i - 1][j][balance] {
                        let next = balance + change
                        if next >= 0 {
                            dp[i][j][next] = true
                        }
                    }
                }
                if j > 0 {
                    for balance in 0...pathLen where dp[i][j - 1][balance] {
                        let next = balance + change
                        if next >= 0 {
                            dp[i][j][next] = true
                        }
                    }
                }
            }
        }
        return dp[n - 1][m - 1][0]
    }
    
    func tests() {
        print(hasValidPath([["(","(","("],[")","(",")"],["(","(",")"],["(","(",")"]])) // true
        print(hasValidPath([[")",")"],["(","("]])) // false
    }
}
