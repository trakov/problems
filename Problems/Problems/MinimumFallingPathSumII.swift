class MinimumFallingPathSumII {
    func minFallingPathSum(_ grid: [[Int]]) -> Int {
        let n = grid.count
        guard n > 1 else { return grid.last?.last ?? 0 }
        var dp = grid[0]
        for row in grid.dropFirst() {
            var min1 = (0, Int.max)
            var min2 = (0, Int.max)
            for val in dp.enumerated() {
                if val.1 < min1.1 {
                    (min2, min1) = (min1, val)
                } else if val.1 < min2.1 {
                    min2 = val
                }
            }
            for (i, val) in row.enumerated() {
                let x = [min1, min2].filter { $0.0 != i }.min { $0.1 < $1.1 }
                dp[i] = val + x!.1
            }
        }
        return dp.min()!
    }
    
    func tests() {
        print(minFallingPathSum([[2,2,1,2,2],[2,2,1,2,2],[2,2,1,2,2],[2,2,1,2,2],[2,2,1,2,2]])) // 7
        print(minFallingPathSum([[1,2,3],[4,5,6],[7,8,9]])) // 13
        print(minFallingPathSum([[7]])) // 7
    }
}

