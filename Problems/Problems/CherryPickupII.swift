class CherryPickupII {
    func cherryPickup(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        var dp = Array(
            repeating: Array(repeating: Array(repeating: -1, count: n), count: n),
            count: m
        )
        var result = 0
        dp[0][0][n-1] = grid[0][0] + grid[0][n-1]
        for i in 1..<m {
            for j in 0..<n {
                for k in j+1..<n {
                    var val = -1
                    for x in -1...1 {
                        for y in -1...1 {
                            if j+x >= 0 && j+x < n && k+y >= 0 && k+y < n {
                                val = max(val, dp[i-1][j+x][k+y])
                            }
                        }
                        if val != -1 {
                            dp[i][j][k] = val + grid[i][j] + grid[i][k]
                        }
                        result = max(result, dp[i][j][k])
                    }
                }
            }
        }
        return result
    }
    
    func tests() {
        print(cherryPickup([[3,1,1],[2,5,1],[1,5,5],[2,1,1]])) // 24
        print(cherryPickup([[1,0,0,0,0,0,1],[2,0,0,0,0,3,0],[2,0,9,0,0,0,0],[0,3,0,5,4,0,0],[1,0,2,3,0,0,6]])) // 28
    }
}

