class NumberOfEnclaves {
    func numEnclaves(_ grid: [[Int]]) -> Int {
        let n = grid.count
        let m = grid[0].count
        var grid = grid
        
        func markLandAsSea(i: Int, j: Int) {
            guard grid[i][j] == 1 else { return }
            let dxy = [(-1,0),(1,0),(0,-1),(0,1)]
            grid[i][j] = 0
            for (dx, dy) in dxy {
                let x = dx + i
                let y = dy + j
                guard x >= 0 && x < n && y >= 0 && y < m else { continue }
                markLandAsSea(i: x, j: y)
            }
        }
        
        for i in 0..<n {
            markLandAsSea(i: i, j: 0)
            markLandAsSea(i: i, j: m-1)
        }
        for j in 0..<m {
            markLandAsSea(i: 0, j: j)
            markLandAsSea(i: n-1, j: j)
        }
        
        var count = 0
        for i in 0 ..< n {
            for j in 0 ..< m {
                if grid[i][j] == 1 {
                    count += 1
                }
            }
        }
        return count
    }

    func tests() {
        print(numEnclaves([[0,0,0,0],[1,0,1,0],[0,1,1,0],[0,0,0,0]])) // 3
        print(numEnclaves([[0,1,1,0],[0,0,1,0],[0,0,1,0],[0,0,0,0]])) // 0
    }
}
