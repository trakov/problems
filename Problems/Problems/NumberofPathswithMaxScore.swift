final class NumberofPathswithMaxScore {
    func pathsWithMaxScore(_ board: [String]) -> [Int] {
        let MOD = 1_000_000_007
        let n = board.count
        var dp = Array(repeating: Array(repeating: Array(repeating: 0, count: 2), count: n), count: n)
        for i in 0..<n {
            for j in 0..<n {
                dp[i][j][0] = -1
            }
        }
        dp[n - 1][n - 1][0] = 0
        dp[n - 1][n - 1][1] = 1
        func update(_ x: Int, _ y: Int, _ u: Int, _ v: Int) {
            if u >= n || v >= n || dp[u][v][0] == -1 {
                return
            }
            if dp[u][v][0] > dp[x][y][0] {
                dp[x][y][0] = dp[u][v][0]
                dp[x][y][1] = dp[u][v][1]
            } else if dp[u][v][0] == dp[x][y][0] {
                dp[x][y][1] = (dp[x][y][1] + dp[u][v][1]) % MOD
            }
        }
        for (i, row) in board.enumerated().reversed() {
            for (j, val) in row.enumerated().reversed() {
                if !(i == n - 1 && j == n - 1) && val != "X" {
                    update(i, j, i + 1, j)
                    update(i, j, i, j + 1)
                    update(i, j, i + 1, j + 1)
                    if dp[i][j][0] != -1 {
                        dp[i][j][0] += (val == "E" ? 0 : Int(val.asciiValue! - Character("0").asciiValue!))
                    }
                }
            }
        }
        if dp[0][0][0] != -1 {
            return [dp[0][0][0], dp[0][0][1] % MOD]
        }
        return [0, 0]
    }

    func tests() {
        print(pathsWithMaxScore(["E23","2X2","12S"])) // [7,1]
        print(pathsWithMaxScore(["E12","1X1","21S"])) // [4,2]
        print(pathsWithMaxScore(["E11","XXX","11S"])) // [0,0]
    }
}
