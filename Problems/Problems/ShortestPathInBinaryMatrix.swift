class ShortestPathInBinaryMatrix {
    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        guard grid.first?.first == 0 && grid.last?.last == 0 else { return -1 }
        let n = grid.count
        guard n > 2 else { return n }
        var grid = grid
        
        func neighbours(of coord: (Int, Int)) -> [(Int, Int)] {
            [(-1,-1),(-1, 0),(-1,1),(0,-1),(0,1),(1,-1),(1,0),(1,1)].compactMap { (i, j) in
                let neigh = (coord.0+i, coord.1+j)
                guard neigh.0 >= 0 && neigh.0 < n && neigh.1 >= 0 && neigh.1 < n else {
                    return nil
                }
                return grid[neigh.0][neigh.1] == 0 ? neigh : nil
            }
        }

        var queue: [(Int, Int)] = [(0,0)]
        grid[0][0] = -1
        var result = 2
        while !queue.isEmpty {
            var newQueue: [(Int, Int)] = []
            for q in queue {
                for neigh in neighbours(of: q) {
                    if neigh.0 == n-1 && neigh.1 == n-1 {
                        return result
                    }
                    newQueue.append(neigh)
                    grid[neigh.0][neigh.1] = -1
                }
            }
            result += 1
            queue = newQueue
        }
        
        return -1
    }
    
    func shortestPathBinaryMatrix2(_ grid: [[Int]]) -> Int {
        guard grid[0][0] == 0, grid.last?.last == 0 else { return -1 }
        let n = grid.count
        var grid = grid
        grid[0][0] = -1
        var queue: [(Int, Int)] = [(0,0)]
        let dxy = [(-1,-1),(-1,0),(0,-1),(-1,1),(1,-1),(1,0),(0,1),(1,1)]
        while !queue.isEmpty {
            var newQueue: [(Int, Int)] = []
            for (i, j) in queue {
                let value = grid[i][j]
                for (dx, dy) in dxy {
                    let x = i + dx
                    let y = j + dy
                    guard x>=0, x<n, y>=0, y<n else { continue }
                    guard grid[x][y] == 0 else { continue }
                    grid[x][y] = min(grid[x][y], value - 1)
                    newQueue.append((x,y))
                }
            }
            queue = newQueue
        }
        
        return -grid.last!.last! == 0 ? -1 : -grid.last!.last!
    }

    func tests() {
        print(shortestPathBinaryMatrix([[0,1],[1,0]])) // 2
        print(shortestPathBinaryMatrix([[0,0,0],[1,1,0],[1,1,0]])) // 4
        print(shortestPathBinaryMatrix([[1,0,0],[1,1,0],[1,1,0]])) // -1
        print(shortestPathBinaryMatrix([[0,0,0,0,1],[1,0,0,0,0],[0,1,0,1,0],[0,0,0,1,1],[0,0,0,1,0]])) // -1
    }
}
