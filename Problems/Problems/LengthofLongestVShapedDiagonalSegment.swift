final class LengthofLongestVShapedDiagonalSegment {
    func lenOfVDiagonal(_ grid: [[Int]]) -> Int {
        let dirs = [(1, 1), (1, -1), (-1, -1), (-1, 1)]
        let (m, n) = (grid.count, grid[0].count)
        var memo = Array(
            repeating: Array(
                repeating: Array(
                    repeating: Array(repeating: -1, count: 2), count: 4
                ),
                count: n
            ),
            count: m
        )
        func dfs(_ cx: Int, _ cy: Int, _ dir: Int, _ turn: Bool, _ target: Int) -> Int {
            let nx = cx + dirs[dir].0
            let ny = cy + dirs[dir].1
            if nx < 0 || ny < 0 || nx >= m || ny >= n || grid[nx][ny] != target {
                return 0
            }
            let turnInt = turn ? 1 : 0
            if memo[nx][ny][dir][turnInt] != -1 {
                return memo[nx][ny][dir][turnInt]
            }
            var maxStep = dfs(nx, ny, dir, turn, 2 - target)
            if turn {
                maxStep = max(maxStep, dfs(nx, ny, (dir + 1) % 4, false, 2 - target))
            }
            memo[nx][ny][dir][turnInt] = maxStep + 1
            return maxStep + 1;
        }
        var result = 0
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 1 {
                    for dir in 0..<4 {
                        result = max(result, dfs(i, j, dir, true, 2) + 1)
                    }
                }
            }
        }
        return result
    }

    func tests() {
        print(lenOfVDiagonal([[2,2,1,2,2],[2,0,2,2,0],[2,0,1,1,0],[1,0,2,2,2],[2,0,0,2,2]])) // 5
        print(lenOfVDiagonal([[2,2,2,2,2],[2,0,2,2,0],[2,0,1,1,0],[1,0,2,2,2],[2,0,0,2,2]])) // 4
        print(lenOfVDiagonal([[1,2,2,2,2],[2,2,2,2,0],[2,0,0,0,0],[0,0,2,2,2],[2,0,0,2,0]])) // 5
        print(lenOfVDiagonal([[1]])) // 1
    }
}
