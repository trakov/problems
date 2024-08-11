class MinimumNumberofDaystoDisconnectIsland {
    func minDays(_ grid: [[Int]]) -> Int {
        let n = grid.count
        let m = grid[0].count
        var grid = grid

        func dfs(_ r: Int, _ c: Int, _ grid: inout [[Int]]) {
            if r < 0 || r >= n || c < 0 || c >= m { return }
            if grid[r][c] != 1 { return }
            grid[r][c] = 2
            for dir in [(1, 0), (-1, 0), (0, 1), (0, -1)] {
                dfs(r + dir.0, c + dir.1, &grid)
            }
        }

        func isDisconnected(_ grid: [[Int]]) -> Bool {
            var grid = grid
            var islands = 0
            for r in 0..<n {
                for c in 0..<m where grid[r][c] == 1 {
                    dfs(r, c, &grid)
                    islands += 1
                }
            }
            return islands != 1
        }

        if isDisconnected(grid) { return 0 }

        for r in 0..<n {
            for c in 0..<m where grid[r][c] == 1 {
                grid[r][c] = 0
                if isDisconnected(grid) { return 1 }
                grid[r][c] = 1
            }
        }

        return 2
    }
    
    func tests() {
        print(minDays([[0,1,1,0],[0,1,1,0],[0,0,0,0]])) // 2
        print(minDays([[1,1,1,1],[1,1,1,1],[1,1,1,1]])) // 2
        print(minDays([[0,0,0,0],[0,0,0,0],[0,0,0,0]])) // 0
        print(minDays([[1,1]])) // 2
        print(minDays([[1,0]])) // 1
        print(minDays([[0,0]])) // 0
        print(minDays([[0,0,0]])) // 0
        print(minDays([[1,1,0,1,1],[1,1,1,1,1],[1,1,0,1,1],[1,1,0,1,1]])) // 1
        print(minDays([[0,0,0],[0,1,0],[0,0,0]])) // 1
        print(minDays([[1,0],[1,1]])) // 1
    }
}

