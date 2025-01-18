class MinimumCosttoMakeatLeastOneValidPathinaGrid {
    func minCost(_ grid: [[Int]]) -> Int {
        let n = grid.count
        let m = grid[0].count
        var minCost = Array(repeating: Array(repeating: Int.max, count: m), count: n)
        var deque = [(0,0)]
        minCost[0][0] = 0
        let dirs = [(0,1),(0,-1),(1,0),(-1,0)]
        while !deque.isEmpty {
            let curr = deque.removeFirst()
            let (i, j) = (curr.0, curr.1)
            for (d, (dx, dy)) in dirs.enumerated() {
                let (x, y) = (i + dx, j + dy)
                let cost = (grid[i][j] != (d + 1)) ? 1 : 0
                if x >= 0, y >= 0, x < n, y < m, minCost[i][j] + cost < minCost[x][y] {
                    minCost[x][y] = minCost[i][j] + cost
                    if cost == 1 {
                        deque.append((x, y))
                    } else {
                        deque.insert((x, y), at: 0)
                    }
                }
            }
        }
        return minCost[n - 1][m - 1]
    }
    
    func tests() {
        print(minCost([[1,1,1,1],[2,2,2,2],[1,1,1,1],[2,2,2,2]])) // 3
        print(minCost([[1,1,3],[3,2,2],[1,1,4]])) // 0
        print(minCost([[1,2],[4,3]])) // 1
        print(minCost([[2,2,2],[2,2,2]])) // 1
    }
}

