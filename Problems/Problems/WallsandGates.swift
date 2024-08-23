class WallsandGates {
    // bfs
    func wallsAndGates(_ rooms: inout [[Int]]) {
        let n = rooms.count
        let m = rooms[0].count
        var queue: [(Int, Int)] = []
        for i in 0..<n {
            for j in 0..<m where rooms[i][j] == 0 {
                queue.append((i, j))
            }
        }
        let INF = 2147483647
        while !queue.isEmpty {
            var next: [(Int, Int)] = []
            for (i, j) in queue {
                for (dx, dy) in [(-1,0),(1,0),(0,-1),(0,1)] {
                    let (x, y) = (i + dx, j + dy)
                    guard x>=0 && x<n && y>=0 && y<m else { continue }
                    guard rooms[x][y] == INF else { continue }
                    next.append((x, y))
                    rooms[x][y] = rooms[i][j] + 1
                }
            }
            queue = next
        }
    }

    // dfs
    func wallsAndGates2(_ rooms: inout [[Int]]) {
        let n = rooms.count
        let m = rooms[0].count
        func dfs(_ i: Int, _ j: Int, _ d: Int) {
            guard i>=0 && i<n && j>=0 && j<m else { return }
            guard rooms[i][j] > 0 else { return }
            guard d < rooms[i][j] else { return }
            rooms[i][j] = d
            dfs(i, j-1, d+1)
            dfs(i, j+1, d+1)
            dfs(i-1, j, d+1)
            dfs(i+1, j, d+1)
        }
        
        for i in 0..<n {
            for j in 0..<m where rooms[i][j] == 0 {
                dfs(i, j-1, 1)
                dfs(i, j+1, 1)
                dfs(i-1, j, 1)
                dfs(i+1, j, 1)
            }
        }
    }
    
    func tests() {
        var rooms = [
            [2147483647,-1,0,2147483647],
            [2147483647,2147483647,2147483647,-1],
            [2147483647,-1,2147483647,-1],
            [0,-1,2147483647,2147483647]
        ]
        wallsAndGates(&rooms)
        print(rooms) // [[3,-1,0,1],[2,2,1,-1],[1,-1,2,-1],[0,-1,3,4]]
        
        rooms = [[-1]]
        wallsAndGates(&rooms)
        print(rooms) // [[-1]]
    }
}

