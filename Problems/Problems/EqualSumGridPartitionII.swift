final class EqualSumGridPartitionII {
    func canPartitionGrid(_ grid: [[Int]]) -> Bool {
        var (m, n) = (grid.count, grid[0].count)
        var grid = grid
        func rotation(_ grid: [[Int]]) -> [[Int]] {
            let (n, m) = (grid.count, grid[0].count)
            var res = Array(repeating: Array(repeating: 0, count: n), count: m)
            for i in 0..<n {
                for j in 0..<m {
                    res[j][n - 1 - i] = grid[i][j]
                }
            }
            return res
        }
        let total = grid.reduce(0) { $0 + $1.reduce(0, +) }
        for _ in 0..<4 {
            var exist: Set<Int> = [0]
            var sum = 0
            m = grid.count
            n = grid[0].count
            if m < 2 {
                grid = rotation(grid)
                continue
            }
            if n == 1 {
                for i in 0..<m-1 {
                    sum += grid[i][0]
                    let tag = sum * 2 - total
                    if tag == 0 || tag == grid[0][0] || tag == grid[i][0] {
                        return true
                    }
                }
                grid = rotation(grid)
                continue
            }
            for i in 0..<m-1 {
                for j in 0..<n {
                    exist.insert(grid[i][j])
                    sum += grid[i][j]
                }
                let tag = sum * 2 - total
                if i == 0 {
                    if tag == 0 || tag == grid[0][0] || tag == grid[0][n - 1] {
                        return true
                    }
                    continue
                }
                if exist.contains(tag) {
                    return true
                }
            }
            grid = rotation(grid)
        }
        return false
    }
    
    func tests() {
        print(canPartitionGrid([[1,4],[2,3]])) // true
        print(canPartitionGrid([[1,3],[2,4]])) // false
        print(canPartitionGrid([[28443],[33959]])) // false
        print(canPartitionGrid([[42047],[57775],[99822]])) // true
        print(canPartitionGrid([[100000,100000,100000],[100000,66005,100000]])) // false
        print(canPartitionGrid([[1,2],[3,4]])) // true
        print(canPartitionGrid([[1,2,4],[2,3,5]])) // false
    }
}
