final class FindtheMinimumAreatoCoverAllOnesI {
    func minimumArea(_ grid: [[Int]]) -> Int {
        let (n, m) = (grid.count, grid[0].count)
        var (x1, y1, x2, y2) = (m, n, 0, 0)
        for (i, row) in grid.enumerated() {
            for (j, val) in row.enumerated() where val == 1 {
                x1 = min(x1, j)
                x2 = max(x2, j)
                y1 = min(y1, i)
                y2 = max(y2, i)
            }
        }
        return (x2 - x1 + 1) * (y2 - y1 + 1)
    }
    
    func tests() {
        print(minimumArea([[0,1,0],[1,0,1]])) // 6
        print(minimumArea([[1,0],[0,0]])) // 1
    }
}
