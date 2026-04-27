final class CheckifThereisaValidPathinaGrid {
    private let TRANS: [[Int]] = [
        [-1, 1, -1, 3],
        [0, -1, 2, -1],
        [3, 2, -1, -1],
        [1, -1, -1, 2],
        [-1, 0, 3, -1],
        [-1, -1, 1, 0]
    ]
    private let DIRS = [[-1, 0], [0, 1], [1, 0], [0, -1]]
    private let START = [[1, 3], [0, 2], [2, 3], [1, 2], [0, 3], [0, 1]]

    func hasValidPath(_ grid: [[Int]]) -> Bool {
        let (m, n) = (grid.count, grid[0].count)
        guard n > 1 || m > 1 else { return true }
        let s = START[grid[0][0] - 1]
        
        func check(_ di: Int) -> Bool {
            guard di != -1 else { return false }
            var (r, c) = (DIRS[di][0], DIRS[di][1])
            var di = di
            while r >= 0 && r < m && c >= 0 && c < n {
                di = TRANS[grid[r][c] - 1][di]
                if di == -1 || r == 0 && c == 0 { return false }
                if r == m - 1 && c == n - 1 { return true }
                r += DIRS[di][0]
                c += DIRS[di][1]
            }
            return false
        }
        return check(s[0]) || check(s[1])
    }
    
    func tests() {
        print(hasValidPath([[2,4,3],[6,5,2]])) // true
        print(hasValidPath([[1,2,1],[1,2,1]])) // false
        print(hasValidPath([[1,1,2]])) // false
    }
}
