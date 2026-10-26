final class CountIslandsWithTotalValueDivisiblebyK {
    func countIslands(_ grid: [[Int]], _ k: Int) -> Int {
        var result = 0
        let (n, m) = (grid.count, grid[0].count)
        var grid = grid
        func dfs(_ i: Int, _ j: Int) -> Int {
            guard i >= 0, i < n, j >= 0, j < m else { return 0 }
            let val = grid[i][j]
            guard val > 0 else { return 0 }
            grid[i][j] = 0
            return dfs(i - 1, j) + dfs(i + 1, j) + dfs(i, j - 1) + dfs(i, j + 1) + val
        }
        for i in grid.indices {
            for j in grid[i].indices where grid[i][j] > 0 {
                let sum = dfs(i, j)
                if sum % k == 0 {
                    result += 1
                }
            }
        }
        return result
    }
    
    func tests() {
        print(countIslands([[0,2,1,0,0],[0,5,0,0,5],[0,0,1,0,0],[0,1,4,7,0],[0,2,0,0,8]], 5)) // 2
        print(countIslands([[3,0,3,0], [0,3,0,3], [3,0,3,0]], 3)) // 6
    }
}
