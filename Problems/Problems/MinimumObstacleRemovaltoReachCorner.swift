class MinimumObstacleRemovaltoReachCorner {
    func minimumObstacles(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        var minObstacles = Array(repeating: Array(repeating: Int.max, count: n), count: m)
        minObstacles[0][0] = 0
        func isValid(_ row: Int, _ col: Int) -> Bool {
            row >= 0 && col >= 0 && row < m && col < n
        }
        var deque: [[Int]] = [[0,0,0]]
        while !deque.isEmpty {
            let current = deque.removeFirst()
            let (obstacles, row, col) = (current[0], current[1], current[2])
            for dir in [[0, 1], [0, -1], [1, 0], [-1, 0]] {
                let (newRow, newCol) = (row + dir[0], col + dir[1])
                if isValid(newRow, newCol) && minObstacles[newRow][newCol] == Int.max {
                    if grid[newRow][newCol] == 1 {
                        minObstacles[newRow][newCol] = obstacles + 1
                        deque.append([obstacles + 1, newRow, newCol])
                    } else {
                        minObstacles[newRow][newCol] = obstacles
                        deque.insert([obstacles, newRow, newCol], at: 0)
                    }
                }
            }
        }
        return minObstacles[m - 1][n - 1]
    }
    
    func tests() {
        print(minimumObstacles([[0,1,1],[1,1,0],[1,1,0]])) // 2
        print(minimumObstacles([[0,1,0,0,0],[0,1,0,1,0],[0,0,0,1,0]])) // 0
    }
}

