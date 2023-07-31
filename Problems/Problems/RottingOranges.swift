class RottingOranges { // not finished
    func orangesRotting(_ grid: [[Int]]) -> Int { // working
        var grid = grid
        var dir = [[1,0],[-1,0],[0,1],[0,-1]]
        var timestamp = 2
        while updateRot(timestamp) { timestamp += 1 }
        func updateRot(_ timestamp: Int) -> Bool {
            var shouldContinue: Bool = false
            for i in 0 ..< grid.count {
                for j in 0 ..< grid[0].count {
                    if grid[i][j] == timestamp {
                        for d in dir {
                            let x = d[0] + i
                            let y = d[1] + j
                            if x >= 0 && y >= 0 && x < grid.count && y < grid[0].count && grid[x][y] == 1 {
                                grid[x][y] = timestamp + 1
                                shouldContinue = true
                            }
                        }
                    }
                }
            }
            return shouldContinue
        }
        for i in 0 ..< grid.count {
            for j in 0 ..< grid[0].count {
                   if grid[i][j] == 1 { return -1 }
            }
        }
        return timestamp - 2
   }

    func orangesRotting2(_ grid: [[Int]]) -> Int { // not working
        let m = grid.count
        let n = grid[0].count
        var rot = -1
        var result = 0
        var i = 0
        var j = 0
        var changed = true
        var hasRottenOrange = false
        var adjacentZeroChecked = false
        var hasFresh = false
        var grid = grid
        let dxy = [(-1,0),(1,0),(0,-1),(0,1)]
        while changed {
            changed = false
            while i < m {
                while j < n {
                    if grid[i][j] == 1 {
                        hasFresh = true
                        if !adjacentZeroChecked {
                            var isAllZero = true
                            for (dx, dy) in dxy {
                                guard i+dx >= 0 && i+dx < m && j+dy >= 0 && j+dy < n else {continue}
                                if grid[i+dx][j+dy] != 0 {
                                    isAllZero = false
                                }
                            }
                            if isAllZero {
                                return -1
                            }
                        }
                    } else if grid[i][j] == 2 || grid[i][j] < 0 {
                        hasRottenOrange = true
                        for (dx, dy) in dxy {
                            guard i+dx >= 0 && i+dx < m && j+dy >= 0 && j+dy < n else {continue}
                            if grid[i+dx][j+dy] == 1 {
                                hasFresh = true
                                changed = true
                                grid[i+dx][j+dy] = grid[i][j] == 2 ? -1 : grid[i][j] - 1
                                result = min(result, grid[i+dx][j+dy])
                            }
                        }
                    }
                    j+=1
                }
                i+=1
                j=0
            }
            if !hasFresh {
                return 0
            }
            if !hasRottenOrange {
                return -1
            }
            i = 0
            j = 0
            if !changed {
//                return -rot
                break
            }
            adjacentZeroChecked = true
            rot -= 1
        }
        return -result
    }

    func tests() {
//        print(orangesRotting([[1,1,2,0,2,0]])) // 2
        print(orangesRotting([[2,1,1],[1,1,1],[0,1,2]])) // 2
//        print(orangesRotting([[1,2]])) // 1
//        print(orangesRotting([[2,1,1],[1,1,0],[0,1,1]])) // 4
//        print(orangesRotting([[2,1,1],[0,1,1],[1,0,1]])) // -1
//        print(orangesRotting([[0,2]])) // 0
    }
}
