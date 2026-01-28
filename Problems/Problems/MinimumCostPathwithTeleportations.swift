final class MinimumCostPathwithTeleportations {
    func minCost(_ grid: [[Int]], _ k: Int) -> Int {
        let (m, n) = (grid.count, grid[0].count)
        var points: [[Int]] = []
        for i in 0..<m {
            for j in 0..<n {
                points.append([i, j])
            }
        }
        points.sort { grid[$0[0]][$0[1]] < grid[$1[0]][$1[1]] }
        var costs = Array(repeating: Array(repeating: Int.max, count: n), count: m)
        for _ in 0...k {
            var minCost = Int.max
            var j = 0
            for i in 0..<points.count {
                minCost = min(
                    minCost,
                    costs[points[i][0]][points[i][1]]
                )
                if i + 1 < points.count &&
                    grid[points[i][0]][points[i][1]] ==
                    grid[points[i + 1][0]][points[i + 1][1]] {
                    continue
                }
                for r in j...i {
                    costs[points[r][0]][points[r][1]] = minCost
                }
                j = i + 1
            }
            for i in (0...m-1).reversed() {
                for j in (0...n-1).reversed() {
                    if i == m - 1 && j == n - 1 {
                        costs[i][j] = 0
                        continue
                    }
                    if i != m - 1 {
                        costs[i][j] = min(
                            costs[i][j],
                            costs[i + 1][j] + grid[i + 1][j]
                        )
                    }
                    if j != n - 1 {
                        costs[i][j] = min(
                            costs[i][j],
                            costs[i][j + 1] + grid[i][j + 1]
                        )
                    }
                }
            }
        }
        return costs[0][0]
    }
    
    func tests() {
        print(minCost([[1,3,3],[2,5,4],[4,3,5]], 2)) // 7
        print(minCost([[1,2],[2,3],[3,4]], 1)) // 9
    }
}
