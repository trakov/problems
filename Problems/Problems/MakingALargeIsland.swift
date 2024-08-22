class MakingALargeIsland {
    func largestIsland(_ grid: [[Int]]) -> Int {
        let n = grid.count
        guard n > 1 else { return 1 }
        var islands: [Int: Int] = [:] // index: count
        var index = 2
        var grid = grid
        
        func dfs(_ i: Int, _ j: Int) -> Int {
            guard i >= 0 && i < n && j >= 0 && j < n else { return 0 }
            guard grid[i][j] == 1 else { return 0 }
            grid[i][j] = index
            return dfs(i - 1, j) + dfs(i + 1, j) + dfs(i, j - 1) + dfs(i, j + 1) + 1
        }
        
        for i in 0..<n {
            for j in 0..<n {
                let count = dfs(i, j)
                if count > 0 {
                    islands[index] = count
                    index += 1
                }
            }
        }
        var result = 0
        for i in 0..<n {
            for j in 0..<n where grid[i][j] == 0 {
                var nearbyIslands: Set<Int> = []
                for (dx, dy) in [(-1,0),(1,0),(0,-1),(0,1)] {
                    let x = i + dx
                    let y = j + dy
                    guard x>=0 && x<n && y>=0 && y<n else { continue }
                    let key = grid[x][y]
                    if key > 0 {
                        nearbyIslands.insert(key)
                    }
                }
                result = max(result, nearbyIslands.reduce(0, {
                    $0 + islands[$1]!
                }) + 1)
            }
        }
        return result > 0 ? result : n*n
    }
    
    func tests() {
        print(largestIsland([[1,0],[0,1]])) // 3
        print(largestIsland([[1,1],[1,0]])) // 4
        print(largestIsland([[1,1],[1,1]])) // 4
    }
}

