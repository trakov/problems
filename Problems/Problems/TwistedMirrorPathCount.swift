final class TwistedMirrorPathCount {
    func uniquePaths(_ grid: [[Int]]) -> Int {
        let MOD = 1000000007
        let (m, n) = (grid.count, grid[0].count)
        var f = Array(repeating: Array(repeating: 0, count: 2), count: n)
        f[0][0] = 1
        for i in 0..<m {
            for j in 0..<n {
                if i > 0 {
                    if grid[i - 1][j] == 0 {
                        f[j][0] = (f[j][0] + f[j][1]) % MOD
                    } else {
                        f[j][0] = f[j][1]
                    }
                }
                if j > 0 {
                    if grid[i][j - 1] == 0 {
                        f[j][1] = (f[j - 1][0] + f[j - 1][1]) % MOD
                    } else {
                        f[j][1] = f[j - 1][0]
                    }
                }
            }
        }
        return (f[n - 1][0] + f[n - 1][1]) % MOD
    }
    
    func tests() {
        print(uniquePaths([[0,1,0],[0,0,1],[1,0,0]])) // 5
        print(uniquePaths([[0,0],[0,0]])) // 2
        print(uniquePaths([[0,1,1],[1,1,0]])) // 1
    }
}
