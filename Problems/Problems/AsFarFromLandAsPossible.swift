class AsFarFromLandAsPossible {
    func maxDistance(_ grid: [[Int]]) -> Int {
        guard grid.count > 1 else { return -1 }
        let n = grid.count
        var grid = grid
        
        func markNeighbours(of queue: [(Int, Int)], with value: Int) -> [(Int, Int)] {
            let dxy = [(0,1),(1,0),(-1,0),(0,-1)]
            var newQueue: [(Int, Int)] = []
            for (i,j) in queue {
                for (dx, dy) in dxy {
                    let x = i + dx
                    let y = j + dy
                    guard x>=0 && y>=0 && x<n && y<n && grid[x][y] == 0 else { continue }
                    grid[x][y] = value
                    newQueue.append((x,y))
                }
            }
            return newQueue
        }
        
        var queue: [(Int, Int)] = [] // coord (x,y)
        for (i, row) in grid.enumerated() {
            for (j, value) in row.enumerated() {
                guard value == 1 else { continue }
                queue.append((i,j))
            }
        }
        guard !queue.isEmpty && queue.count<n*n else { return -1 }
        
        var result = 0

        while !queue.isEmpty {
            result -= 1
            queue = markNeighbours(of: queue, with: result)
        }
        
        return -result-1
    }

    func tests() {
        print(maxDistance([[1,0,1],[0,0,0],[1,0,1]])) // 2
        print(maxDistance([[1,0,0],[0,0,0],[0,0,0]])) // 4
    }
}
