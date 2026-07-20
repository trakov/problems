final class Shift2DGrid {
    func shiftGrid(_ grid: [[Int]], _ k: Int) -> [[Int]] {
        var result = grid
        let (n, m) = (grid.count, grid[0].count)
        for (i, row) in grid.enumerated() {
            for (j, val) in row.enumerated() {
                let index = (i * m + j + k) % (n * m)
                let (newI, newJ) = (index / m, index % m)
                result[newI][newJ] = val
            }
        }
        return result
    }
    
    func tests() {
        print(shiftGrid([[1,2,3],[4,5,6],[7,8,9]], 1))
        // [[9,1,2],[3,4,5],[6,7,8]]
        print(shiftGrid([[3,8,1,9],[19,7,2,5],[4,6,11,10],[12,0,21,13]], 4))
        // [[12,0,21,13],[3,8,1,9],[19,7,2,5],[4,6,11,10]]
        print(shiftGrid([[1,2,3],[4,5,6],[7,8,9]], 9))
        // [[1,2,3],[4,5,6],[7,8,9]]
        print(shiftGrid([[1],[2],[3],[4],[7],[6],[5]], 23))
        // [[6],[5],[1],[2],[3],[4],[7]]
        print(shiftGrid([[1,2],[3,4],[5,6],[7,8],[9,10]], 3))
        // [[8, 9], [10, 1], [2, 3], [4, 5], [6, 7]]
    }
}
