class NumberOfIncreasingPathsInAGrid {
    func countPaths(_ grid: [[Int]]) -> Int {
        let n = grid.count
        let m = grid[0].count
        guard n > 0 && m > 0 else { return 0 }
        guard n > 1 || m > 1 else { return 1 }
        var result = 0
        let mod = 1_000_000_007
        
        var dp = Array(repeating: Array(repeating: 0, count: m), count: n)
        
        func neighbours(of coord: (Int, Int)) -> [(Int, Int)] {
            [(-1, 0), (1, 0), (0, -1), (0, 1)].compactMap { (dx, dy) in
                let x = coord.0 + dx
                let y = coord.1 + dy
                guard x >= 0 && y >= 0 && x < n && y < m else { return nil }
                return grid[x][y] > grid[coord.0][coord.1] ? (x, y) : nil
            }
        }
        
        func dfs(_ i: Int, _ j: Int) -> Int {
            guard dp[i][j] == 0 else { return dp[i][j] }
            var res = 1
            for neigh in neighbours(of: (i, j)) {
                res = (res + dfs(neigh.0, neigh.1)) % mod
            }
            dp[i][j] = res
            return res
        }
        for i in 0..<n {
            for j in 0..<m {
                result = (result + dfs(i, j)) % mod
            }
        }
        
        return result
    }
    
    func tests() {
        print(countPaths([[1,1],[3,4]])) // 8
        print(countPaths([[1],[2]])) // 3
    }
}

