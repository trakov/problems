final class SortMatrixbyDiagonals {
    func sortMatrix(_ grid: [[Int]]) -> [[Int]] {
        let n = grid.count
        var grid = grid
        for i in 0..<n {
            var tmp: [Int] = []
            for j in 0..<n-i {
                tmp.append(grid[i + j][j])
            }
            tmp.sort(by: >)
            for j in 0..<n-i {
                grid[i + j][j] = tmp[j]
            }
        }
        for j in 1..<n {
            var tmp: [Int] = []
            for i in 0..<n-j {
                tmp.append(grid[i][j + i])
            }
            tmp.sort()
            for i in 0..<n-j {
                grid[i][j + i] = tmp[i]
            }
        }
        return grid
    }
    
    func tests() {
        print(sortMatrix([[1,7,3],[9,8,2],[4,5,6]])) // [[8,2,3],[9,6,7],[4,5,1]]
        print(sortMatrix([[0,1],[1,2]])) // [[2,1],[1,0]]
        print(sortMatrix([[1]])) // [[1]]
    }
}
