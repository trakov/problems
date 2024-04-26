class MinimumPathSum {
    func minPathSum(_ grid: [[Int]]) -> Int {
        var grid = grid
        for (i, row) in grid.enumerated() {
            for (j, val) in row.enumerated() {
                var prev = (i == 0 && j == 0) ? 0 : Int.max
                if i > 0 { prev = min(prev, grid[i - 1][j]) }
                if j > 0 { prev = min(prev, grid[i][j - 1]) }
                grid[i][j] = prev + val
            }
        }
        return grid.last?.last ?? -1
    }

    func minPathSum2(_ grid: [[Int]]) -> Int {
        var grid = grid
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                guard i != 0 || j != 0 else { continue }
                if i == 0 {
                    grid[i][j] += grid[i][j-1]
                } else if j == 0 {
                    grid[i][j] += grid[i-1][j]
                } else {
                    grid[i][j] += min(grid[i][j-1], grid[i-1][j])
                }
            }
        }
        
        return grid.last!.last!
    }
    
    func tests() {
        print(minPathSum([[1,3,1],[1,5,1],[4,2,1]])) // 7
        print(minPathSum([[1,2,3],[4,5,6]])) // 12
    }
}

