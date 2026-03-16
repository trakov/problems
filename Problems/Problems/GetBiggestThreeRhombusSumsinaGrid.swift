final class GetBiggestThreeRhombusSumsinaGrid {
    func getBiggestThree(_ grid: [[Int]]) -> [Int] {
        let n = grid.count
        let m = grid[0].count
        var sums = Set<Int>()
        func calc(_ x: Int, _ y: Int) {
            let maxSize = min(y + 1, m - y, (n - x + 1) / 2)
            for k in 0..<maxSize {
                if k == 0 {
                    sums.insert(grid[x][y])
                    continue
                }
                var s = 0
                var i = x
                var j = y
                for _ in 0..<k {
                    s += grid[i][j]
                    i += 1
                    j -= 1
                }
                for _ in 0..<k {
                    s += grid[i][j]
                    i += 1
                    j += 1
                }
                for _ in 0..<k {
                    s += grid[i][j]
                    i -= 1
                    j += 1
                }
                for _ in 0..<k {
                    s += grid[i][j]
                    i -= 1
                    j -= 1
                }
                sums.insert(s)
            }
        }
        for i in 0..<n {
            for j in 0..<m {
                calc(i, j)
            }
        }
        return sums.sorted(by: >).prefix(3).map { $0 }
    }
    
    func tests() {
        print(
            getBiggestThree([[3,4,5,1,3],[3,3,4,2,3],[20,30,200,40,10],[1,5,5,4,1],[4,3,2,2,5]])
        ) // [228,216,211]
        print(getBiggestThree([[1,2,3],[4,5,6],[7,8,9]])) // [20,9,8]
    }
}
