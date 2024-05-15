class FindtheSafestPathinaGrid {
    struct Pair: Hashable {
        let x: Int
        let y: Int
        init(x: Int, y: Int) {
            self.x = x
            self.y = y
        }
        init?(x: Int, y: Int, n: Int) {
            guard x>=0 && y>=0 && x<n && y<n else { return nil }
            self.init(x: x, y: y)
        }
    }
    func maximumSafenessFactor(_ grid: [[Int]]) -> Int {
        let n = grid.count
        guard n > 1 else { return 0 }
        guard grid.first?.first == 0 && grid.last?.last == 0 else { return 0 }
        var grid = grid
        
        func fillDistances(_ i: Int, _ j: Int) {
            var queue = [(i,j)]
            var d = -1
            while !queue.isEmpty && d > -n {
                var nextQueue: [(Int,Int)] = []
                for (a,b) in queue {
                    for (dx, dy) in [(0,1),(0,-1),(1,0),(-1,0)] {
                        let x = dx + a
                        let y = dy + b
                        guard x>=0 && y>=0 && x<n && y<n else { continue }
//                        guard grid[x][y] != 1 else { continue } // another thief
                        if grid[x][y] == 0 || grid[x][y] < d {
                            grid[x][y] = d
                            nextQueue.append((x,y))
                        }
                    }
                }
                queue = nextQueue
                d -= 1
            }
        }
        
        for (i, row) in grid.enumerated() {
            for (j, val) in row.enumerated() where val == 1 {
                fillDistances(i, j)
            }
        }
        
        for (i, row) in grid.enumerated() {
            for (j, val) in row.enumerated() where val == 0 {
                grid[i][j] = -n + 1
            }
        }
        
        func hasPath(_ factor: Int) -> Bool {
            guard grid[0][0] <= factor && grid[n-1][n-1] <= factor else { return false }
            let topLeftPair = Pair(x: 0, y: 0)
            var queue = [topLeftPair]
            var visited: Set<Pair> = [topLeftPair]
            while !queue.isEmpty {
                var nextQueue: [Pair] = []
                for p in queue {
                    for (dx, dy) in [(0,1),(0,-1),(1,0),(-1,0)] {
                        guard let pair = Pair(x: dx+p.x, y: dy+p.y, n: n) else { continue }
                        guard grid[pair.x][pair.y] <= factor else { continue }
                        if pair.x == n - 1 && pair.y == n - 1 { return true }
                        guard visited.insert(pair).inserted else { continue }
                        nextQueue.append(pair)
                    }
                }
                queue = nextQueue
            }
            return false
        }
        
        var left = 0
        var right = n-1
        
        while left <= right {
            let mid = (left + right) / 2
            if hasPath(-mid) {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return max(right, 0)
    }
    
    func tests() {
        print(maximumSafenessFactor([[0,1,0],[0,0,0],[0,0,0]])) // 1
        print(maximumSafenessFactor([[0,1],[0,0]])) // 1
        print(maximumSafenessFactor([[0,1,1],[1,1,1],[1,1,0]])) // 0
        print(maximumSafenessFactor([[1,0,0],[0,0,0],[0,0,1]])) // 0
        print(maximumSafenessFactor([[0,0,1],[0,0,0],[0,0,0]])) // 2
        print(maximumSafenessFactor([[0,0,0,1],[0,0,0,0],[0,0,0,0],[1,0,0,0]])) // 2
    }
}

