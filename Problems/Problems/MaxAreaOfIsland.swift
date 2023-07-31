class MaxAreaOfIsland {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var result = 0
        var grid = grid
        var i = 0
        var j = 0
        while i < grid.count {
            while j < grid[i].count {
                if grid[i][j] == 0 { j += 1; continue }
                result = max(result, findIsland(x: i, y: j, grid: &grid))
            }
            i += 1
            j = 0
        }
        
        return result
    }
    
    func findIsland(x: Int, y: Int, grid: inout [[Int]]) -> Int {
        guard x >= 0 && x < grid.count && y >= 0 && y < grid[0].count else {
            return 0
        }
        if grid[x][y] == 0 {
            return 0
        }
        grid[x][y] = 0
        return 1 +
        findIsland(x: x-1, y: y, grid: &grid) +
        findIsland(x: x+1, y: y, grid: &grid) +
        findIsland(x: x, y: y-1, grid: &grid) +
        findIsland(x: x, y: y+1, grid: &grid)
    }

    func tests() {
        print(maxAreaOfIsland([[0,1]])) // 1
        print(maxAreaOfIsland([[0,0,1,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,1,1,0,1,0,0,0,0,0,0,0,0],[0,1,0,0,1,1,0,0,1,0,1,0,0],[0,1,0,0,1,1,0,0,1,1,1,0,0],[0,0,0,0,0,0,0,0,0,0,1,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,0,0,0,0,0,0,1,1,0,0,0,0]])) // 6
        print(maxAreaOfIsland([[0,0,0,0,0,0,0,0]])) // 0
    }
}
