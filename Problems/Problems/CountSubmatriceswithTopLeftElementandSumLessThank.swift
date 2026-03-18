final class CountSubmatriceswithTopLeftElementandSumLessThank {
    func countSubmatrices(_ grid: [[Int]], _ k: Int) -> Int {
        var grid = grid
        var result = 0
        for i in grid.indices {
            for j in grid[i].indices {
                var val = grid[i][j]
                if i > 0 { val += grid[i-1][j] }
                if j > 0 { val += grid[i][j-1] }
                if i > 0, j > 0 { val -= grid[i-1][j-1] }
                grid[i][j] = val
                if val <= k {
                    result += 1
                } else if j == 0 {
                    return result
                } else {
                    break
                }
            }
        }
        return result
    }
    
    func tests() {
        print(countSubmatrices([[7,6,3],[6,6,1]], 18)) // 4
        print(countSubmatrices([[7,2,9],[1,5,0],[2,6,6]], 20)) // 6
    }
}
