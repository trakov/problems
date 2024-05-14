class PathwithMaximumGold {
    func getMaximumGold(_ grid: [[Int]]) -> Int {
        let n = grid.count
        let m = grid[0].count
        var grid = grid
        func dfs(_ i: Int, _ j: Int) -> Int {
            guard i>=0 && j>=0 && i<n && j<m && grid[i][j] > 0 else { return 0 }
            let val = grid[i][j]
            grid[i][j] = 0
            let maxVal = max(
                dfs(i+1, j),
                dfs(i-1, j),
                dfs(i, j+1),
                dfs(i, j-1)
            )
            grid[i][j] = val
            return maxVal + val
        }
        var result = 0
        for i in 0..<n {
            for j in 0..<m {
                result = max(result, dfs(i, j))
            }
        }
        return result
    }
    
    func tests() {
        print(getMaximumGold([[0,6,0],[5,8,7],[0,9,0]])) // 24
        print(getMaximumGold([[1,0,7],[2,0,6],[3,4,5],[0,3,0],[9,0,20]])) // 28
    }
}

