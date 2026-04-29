final class MaximumScoreFromGridOperations {
    func maximumScore(_ grid: [[Int]]) -> Int {
        let n = grid[0].count
        guard n != 1 else { return 0 }
        var dp = Array(
            repeating: Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1), count: n
        )
        var prevMax = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)
        var prevSuffixMax = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)
        var colSum = Array(repeating: Array(repeating: 0, count: n + 1), count: n)
        for c in 0..<n {
            for r in 1...n {
                colSum[c][r] = colSum[c][r - 1] + grid[r - 1][c]
            }
        }
        for i in 1..<n {
            for currH in 0...n {
                for prevH in 0...n {
                    if currH <= prevH {
                        let extraScore = colSum[i][prevH] - colSum[i][currH]
                        dp[i][currH][prevH] = max(dp[i][currH][prevH], prevSuffixMax[prevH][0] + extraScore)
                    } else {
                        let extraScore = colSum[i - 1][currH] - colSum[i - 1][prevH]
                        dp[i][currH][prevH] = max(
                            dp[i][currH][prevH], prevSuffixMax[prevH][currH], prevMax[prevH][currH] + extraScore
                        )
                    }
                }
            }
            for currH in 0...n {
                prevMax[currH][0] = dp[i][currH][0]
                if n >= 1 {
                    for prevH in 1...n {
                        let penalty = prevH > currH ? colSum[i][prevH] - colSum[i][currH] : 0
                        prevMax[currH][prevH] = max(prevMax[currH][prevH - 1], dp[i][currH][prevH] - penalty)
                    }
                }
                prevSuffixMax[currH][n] = dp[i][currH][n]
                if n >= 1 {
                    for prevH in stride(from: n - 1, through: 0, by: -1) {
                        prevSuffixMax[currH][prevH] = max(prevSuffixMax[currH][prevH + 1], dp[i][currH][prevH])
                    }
                }
            }
        }
        var result = 0
        for k in 0...n {
            result = max(result, dp[n - 1][n][k], dp[n - 1][0][k])
        }
        return result
    }
    
    func tests() {
        print(maximumScore([
            [0,0,0,0,0],[0,0,3,0,0],[0,1,0,0,0],[5,0,0,3,0],[0,0,0,0,2]
        ])) // 11
        print(maximumScore([
            [10,9,0,0,15],[7,1,0,8,0],[5,20,0,11,0],[0,0,0,1,2],[8,12,1,10,3]
        ])) // 94
    }
}
