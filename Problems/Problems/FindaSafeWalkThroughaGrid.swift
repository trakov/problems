final class FindaSafeWalkThroughaGrid {
    func findSafeWalk(_ grid: [[Int]], _ health: Int) -> Bool {
        var dp: [[Int] : Bool] = [:]
        let r = grid.count
        let c = grid[0].count
        var visited = Array(repeating: Array(repeating: false, count: c), count: r)
        
        func helper(_ grid: [[Int]], _ health: Int, _ i: Int, _ j: Int, _ visited: [[Bool]], _ r: Int, _ c: Int) -> Bool {
            if let value = dp[[health,i,j]] {
                return value
            }
            if health == 0 || i < 0 || j < 0 || i >= r || j >= c || visited[i][j] {
                return false
            }
            var newHealth = health
            if grid[i][j] == 1 {
                newHealth -= 1
            }
            if newHealth >= 1 && i == r-1 && j == c-1 {
                dp[[health,i,j]] = true
                return true
            }
            var vistedCopy = visited
            vistedCopy[i][j] = true
            let paths: [[Int]] = [[0,1],[0,-1],[1,0],[-1,0]]
            for path in paths {
                if helper(grid,newHealth,i+path[0],j+path[1], vistedCopy, r, c) {
                    dp[[health,i,j]] = true
                    return true
                }
            }
            dp[[health,i,j]] = false
            return false
        }
        return helper(grid, health, 0, 0, visited, r, c)
    }

    func tests() {
        print(findSafeWalk([[0,1,0,0,0],[0,1,0,1,0],[0,0,0,1,0]], 1)) // true
        print(findSafeWalk([[0,1,1,0,0,0],[1,0,1,0,0,0],[0,1,1,1,0,1],[0,0,1,0,1,0]], 3)) // false
        print(findSafeWalk([[1,1,1],[1,0,1],[1,1,1]], 5)) // true
    }
}
