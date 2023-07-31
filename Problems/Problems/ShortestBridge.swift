class ShortestBridge {
    func shortestBridge(_ grid: [[Int]]) -> Int {
        let n = grid.count
        var grid = grid
        var bridgeQueue: [(Int, Int)] = []
        
        func neighbours(i: Int, j: Int) -> [(Int, Int)] {
            [(0,1),(0,-1),(1,0),(-1,0)].compactMap {
                let x = i + $0
                let y = j + $1
                guard x>=0 && x<n && y>=0 && y<n else { return nil }
                return (x, y)
            }
        }
        func visitIsland(i: Int, j: Int) {
            grid[i][j] = -1
            for (x, y) in neighbours(i: i, j: j) {
                if grid[x][y] == 1 {
                    visitIsland(i: x, j: y)
                } else if grid[x][y] == 0 {
                    bridgeQueue.append((x, y))
                    grid[x][y] = -1
                }
            }
        }
        var islandFound = false
        for i in 0..<n {
            for j in 0..<n where grid[i][j] == 1 {
                visitIsland(i: i, j: j)
                islandFound = true
                break
            }
            if islandFound { break }
        }
        
        var count = 1
        while !bridgeQueue.isEmpty {
            var next: [(Int, Int)] = []
            for (i, j) in bridgeQueue {
                for (x, y) in neighbours(i: i, j: j) {
                    switch grid[x][y] {
                    case 1:
                        return count
                    case 0:
                        next.append((x, y))
                        grid[x][y] = -count
                    default:
                        break
                    }
                }
            }
            bridgeQueue = next
            count += 1
        }
        
        return -count
    }

    func tests() {
        print(shortestBridge([[0,1],[1,0]])) // 1
        print(shortestBridge([[1,0,0],[0,0,0],[0,0,1]])) // 3
        print(shortestBridge([[0,1,0],[0,0,0],[0,0,1]])) // 2
        print(shortestBridge([[1,1,1,1,1],[1,0,0,0,1],[1,0,1,0,1],[1,0,0,0,1],[1,1,1,1,1]])) // 1
    }
}
