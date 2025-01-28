class MaximumNumberofFishinaGrid {
    func findMaxFish(_ grid: [[Int]]) -> Int {
        let n = grid.count
        let m = grid[0].count
        var grid = grid
        var result = 0
        
        func dfs(_ i: Int, _ j: Int) -> Int {
            guard i >= 0, i < n, j >= 0, j < m else { return 0 }
            guard grid[i][j] > 0 else { return 0 }
            let val = grid[i][j]
            grid[i][j] = 0
            return val + dfs(i + 1, j) + dfs(i - 1, j) + dfs(i, j + 1) + dfs(i, j - 1)
        }
        
        for i in 0..<n {
            for j in 0..<m {
                result = max(result, dfs(i, j))
            }
        }
        
        return result
    }
    
    func tests() {
        print(findMaxFish([[0,2,1,0],[4,0,0,3],[1,0,0,4],[0,3,2,0]])) // 7
        print(findMaxFish([[1,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,1]])) // 1
    }
}

