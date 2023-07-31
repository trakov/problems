class NumberOfIslands2 {
    func numIslands(_ grid: [[Character]]) -> Int {
        bfs(grid)
    }
    
    func recursive(_ grid: [[Character]]) -> Int {
        var result = 0
        var grid = grid

        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if grid[i][j] == "1" {
                    result += 1
                    findIsland(i: i, j: j, grid: &grid)
                }
            }
        }

        return result
    }
    
    func findIsland(i: Int, j: Int, grid: inout [[Character]]) {
        guard i >= 0, i < grid.count, j >= 0, j < grid[0].count else { return }
        guard grid[i][j] == "1" else { return }
        grid[i][j] = "-"
        findIsland(i: i+1, j: j, grid: &grid)
        findIsland(i: i-1, j: j, grid: &grid)
        findIsland(i: i, j: j+1, grid: &grid)
        findIsland(i: i, j: j-1, grid: &grid)
    }
    
    func bfs(_ grid: [[Character]]) -> Int {
        var result = 0
        var grid = grid // to store visited cells
        var queue: [(Int, Int)] = [] // (i,j) pairs
        let dxy = [(1,0),(-1,0),(0,-1),(0,1)]
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                guard grid[i][j] == "1" else { continue }
                result += 1
                queue = [(i,j)]
                grid[i][j] = "-"
                while !queue.isEmpty {
                    let (x,y) = queue.removeLast()
                    for (dx, dy) in dxy {
                        guard x + dx >= 0, x + dx < grid.count, y + dy >= 0, y + dy < grid[0].count else { continue
                        }
                        guard grid[x+dx][y+dy] == "1" else { continue }
                        queue.append((x+dx,y+dy))
                        grid[x+dx][y+dy] = "-"
                    }
                }
            }
        }
        return result
    }

    func tests() {
        print(numIslands([["1","0","1","1","0","1","1"]])) // 3
        print(numIslands(
            [
                ["1","0","1"],
                ["1","1","1"],
                ["0","0","0"],
                ["0","0","0"]
            ]
        )) // 1

        print(numIslands(
            [
                ["1","1","1","1","0"],
                ["1","1","0","1","0"],
                ["1","1","0","0","0"],
                ["0","0","0","0","0"]
            ]
        )) // 1

        print(numIslands(
            [
                ["1","1","0","0","0"],
                ["1","1","0","0","0"],
                ["0","0","1","0","0"],
                ["0","0","0","1","1"]
            ]
        )) // 3
    }
}
