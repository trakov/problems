class NumberOfClosedIslands {
    func closedIsland(_ grid: [[Int]]) -> Int {
        let n = grid.count
        let m = grid[0].count
        guard n > 2 && m > 2 else { return 0 }
        var grid = grid
        for i in 0..<n {
            if grid[i][0] == 0 {
                mark(i: i, j: 0, grid: &grid, val: 0, newVal: -1)
            }
            if grid[i][m - 1] == 0 {
                mark(i: i, j: m - 1, grid: &grid, val: 0, newVal: -1)
            }
        }
        for j in 0..<m {
            if grid[0][j] == 0 {
                mark(i: 0, j: j, grid: &grid, val: 0, newVal: -1)
            }
            if grid[n-1][j] == 0 {
                mark(i: n - 1, j: j, grid: &grid, val: 0, newVal: -1)
            }
        }
        var count = 0
        for i in 1..<n-1 {
            for j in 1..<m-1 {
                let val = grid[i][j]
                guard val == 0 else { continue }
                count += 1
                mark(i: i, j: j, grid: &grid, val: 0, newVal: -2)
            }
        }
        
        return count
    }
    
    func mark(i: Int, j: Int, grid: inout [[Int]], val: Int, newVal: Int) {
        grid[i][j] = newVal
        let dxy = [(-1,0), (1,0), (0,-1), (0,1)]
        for (dx, dy) in dxy {
            let x = i + dx
            let y = j + dy
            guard x >= 0 && x < grid.count && y >= 0 && y < grid[0].count else { continue }
            if grid[x][y] == val {
                grid[x][y] = newVal
                mark(i: x, j: y, grid: &grid, val: val, newVal: newVal)
            }
        }
    }

    func printGrid(grid: [[Int]]) {
        for i in 0..<grid.count {
            let str = grid[i].reduce("") { $0 + String($1) }
            print(str)
        }
    }
    
    func tests() {
        print(closedIsland([
            [0,0,1,1,0,1,0,0,1,0],
            [1,1,0,1,1,0,1,1,1,0],
            [1,0,1,1,1,0,0,1,1,0],
            [0,1,1,0,0,0,0,1,0,1],
            [0,0,0,0,0,0,1,1,1,0],
            [0,1,0,1,0,1,0,1,1,1],
            [1,0,1,0,1,1,0,0,0,1],
            [1,1,1,1,1,1,0,0,0,0],
            [1,1,1,0,0,1,0,1,0,1],
            [1,1,1,0,1,1,0,1,1,0]] // 5
))
//        print(closedIsland([
//            [1,1,1,1,1,1,1,0],
//            [1,0,0,0,0,1,1,0],
//            [1,0,1,0,1,1,1,0],
//            [1,0,0,0,0,1,0,1],
//            [1,1,1,1,1,1,1,0]
//        ])) // 2
//        print(closedIsland([[0,0,1,0,0],[0,1,0,1,0],[0,1,1,1,0]])) // 1
//        print(closedIsland([[1,1,1,1,1,1,1],
//                            [1,0,0,0,0,0,1],
//                            [1,0,1,1,1,0,1],
//                            [1,0,1,0,1,0,1],
//                            [1,0,1,1,1,0,1],
//                            [1,0,0,0,0,0,1],
//                            [1,1,1,1,1,1,1]])) // 2
    }
}
