class CountSubIslands {
    func countSubIslands(_ grid1: [[Int]], _ grid2: [[Int]]) -> Int {
        var count = 0
        var grid = grid2
        let n = grid.count
        let m = grid[0].count
        
        func mark(i: Int, j: Int, isCovered: inout Bool) {
            guard grid[i][j] == 1 else { return }
            grid[i][j] = 0
            let dxy = [(0,1),(0,-1),(-1,0),(1,0)]
            for (dx, dy) in dxy {
                let x = i + dx
                let y = j + dy
                guard x >= 0 && x < n && y >= 0 && y < m else { continue }
                if grid[x][y] == 1 && grid1[x][y] == 0 {
                    isCovered = false
                }
                mark(i: x, j: y, isCovered: &isCovered)
            }
        }
        
        for i in 0..<n {
            for j in 0..<m {
                let shouldCount = grid[i][j] == 1 && grid1[i][j] == 1
                var isCovered = true
                mark(i: i, j: j, isCovered: &isCovered)
                if isCovered && shouldCount { count += 1 }
            }
        }
        
        return count
    }

    func tests() {
        print(countSubIslands(
            [[1,1,1,0,0],[0,1,1,1,1],[0,0,0,0,0],[1,0,0,0,0],[1,1,0,1,1]],
            [[1,1,1,0,0],[0,0,1,1,1],[0,1,0,0,0],[1,0,1,1,0],[0,1,0,1,0]]
        )) // 3
        print(countSubIslands(
            [[1,0,1,0,1],[1,1,1,1,1],[0,0,0,0,0],[1,1,1,1,1],[1,0,1,0,1]],
            [[0,0,0,0,0],[1,1,1,1,1],[0,1,0,1,0],[0,1,0,1,0],[1,0,0,0,1]]
        )) // 2
    }
}
