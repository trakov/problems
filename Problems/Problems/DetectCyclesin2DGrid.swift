final class DetectCyclesin2DGrid {
    func containsCycle(_ grid: [[Character]]) -> Bool {
        let (n, m) = (grid.count, grid[0].count)
        guard n > 1, m > 1 else { return false }
        var grid = grid
        
        func check(_ i: Int, _ j: Int, _ prevX: Int, _ prevY: Int) -> Bool {
            let val = grid[i][j]
            grid[i][j] = val.uppercased().first!
            for (dx, dy) in [(0, 1), (0, -1), (1, 0), (-1, 0)] {
                let (x, y) = (i + dx, j + dy)
                if x != prevX || y != prevY {
                    if x >= 0 && x < n && y >= 0 && y < m {
                        if grid[x][y].lowercased() == grid[i][j].lowercased() {
                            if grid[x][y].isUppercase || check(x, y, i, j) {
                                return true
                            }
                        }
                    }
                }
            }
            return false;
        }
        
        for i in 0..<n {
            for j in 0..<m where grid[i][j].isLowercase && check(i, j, 0, 0) {
                return true
            }
        }
        return false
    }
    
    func tests() {
        print(containsCycle([["a","a","a","a"],["a","b","b","a"],["a","b","b","a"],["a","a","a","a"]])) // true
        print(containsCycle([["c","c","c","a"],["c","d","c","c"],["c","c","e","c"],["f","c","c","c"]])) // true
        print(containsCycle([["a","b","b"],["b","z","b"],["b","b","a"]])) // false
    }
}
