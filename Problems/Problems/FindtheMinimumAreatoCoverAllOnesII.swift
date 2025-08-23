final class FindtheMinimumAreatoCoverAllOnesII {
    func minimumSum(_ grid: [[Int]]) -> Int {
        min(solve(grid), solve(rotate(grid)))
    }
    func minimumSum2(_ grid: [[Int]], _ u: Int, _ d: Int, _ l: Int, _ r: Int) -> Int {
        var min_i = grid.count
        var max_i = 0
        var min_j = grid[0].count
        var max_j = 0
        for i in u...d {
            for j in l...r {
                if grid[i][j] == 1 {
                    min_i = min(min_i, i)
                    min_j = min(min_j, j)
                    max_i = max(max_i, i)
                    max_j = max(max_j, j)
                }
            }
        }
        return min_i <= max_i
        ? (max_i - min_i + 1) * (max_j - min_j + 1)
        : Int.max / 3
    }

    func rotate(_ vec: [[Int]]) -> [[Int]] {
        let n = vec.count
        let m = vec[0].count
        var ret = Array(repeating: Array(repeating: 0, count: n), count: m)
        for i in 0..<n {
            for j in 0..<m {
                ret[m - j - 1][i] = vec[i][j]
            }
        }
        return ret
    }

    func solve(_ grid: [[Int]]) -> Int {
        let n = grid.count
        let m = grid[0].count
        var res = n * m
        for i in 0..<n-1 {
            for j in 0..<m-1 {
                res = min(
                    res,
                    minimumSum2(grid, 0, i, 0, m - 1) +
                    minimumSum2(grid, i + 1, n - 1, 0, j) +
                    minimumSum2(grid, i + 1, n - 1, j + 1, m - 1),
                    minimumSum2(grid, 0, i, 0, j) +
                    minimumSum2(grid, 0, i, j + 1, m - 1) +
                    minimumSum2(grid, i + 1, n - 1, 0, m - 1)
                )
            }
        }
        for i in 0..<n-2 {
            for j in i+1..<n-1 {
                res = min(
                    res,
                    minimumSum2(grid, 0, i, 0, m - 1) +
                    minimumSum2(grid, i + 1, j, 0, m - 1) +
                    minimumSum2(grid, j + 1, n - 1, 0, m - 1)
                )
            }
        }
        return res
    }

    func tests() {
        print(minimumSum([[1,0,1],[1,1,1]])) // 5
        print(minimumSum([[1,0,1,0],[0,1,0,1]])) // 5
    }
}
