class CountUnguardedCellsintheGrid {
    let UNGUARDED = 0
    let GUARDED = 1
    let GUARD = 2
    let WALL = 3

    func countUnguarded(_ m: Int, _ n: Int, _ guards: [[Int]], _ walls: [[Int]]) -> Int {
        var grid = Array(repeating: Array(repeating: 0, count: n), count: m)
        for g in guards {
            grid[g[0]][g[1]] = GUARD
        }
        for w in walls {
            grid[w[0]][w[1]] = WALL
        }
        func mark(_ i: Int, _ j: Int) {
            for r in (0..<i).reversed() {
                if grid[r][j] == WALL || grid[r][j] == GUARD { break }
                grid[r][j] = GUARDED
            }
            for r in i+1..<m {
                if grid[r][j] == WALL || grid[r][j] == GUARD { break }
                grid[r][j] = GUARDED
            }
            for c in (0..<j).reversed() {
                if grid[i][c] == WALL || grid[i][c] == GUARD { break }
                grid[i][c] = GUARDED
            }
            for c in j+1..<n {
                if grid[i][c] == WALL || grid[i][c] == GUARD { break }
                grid[i][c] = GUARDED
            }
        }
        for g in guards {
            mark(g[0], g[1])
        }
        var result = 0
        for row in grid {
            for val in row where val == UNGUARDED {
                result += 1
            }
        }
        return result
    }
    
    func tests() {
        print(countUnguarded(4, 6, [[0,0],[1,1],[2,3]], [[0,1],[2,2],[1,4]])) // 7
        print(countUnguarded(3, 3, [[1,1]], [[0,1],[1,0],[2,1],[1,2]])) // 4
    }
}

