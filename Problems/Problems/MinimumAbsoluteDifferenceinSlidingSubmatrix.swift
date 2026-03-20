final class MinimumAbsoluteDifferenceinSlidingSubmatrix {
    func minAbsDiff(_ grid: [[Int]], _ k: Int) -> [[Int]] {
        let m = grid.count
        let n = grid[0].count
        var result = Array(repeating: Array(repeating: 0, count: n - k + 1), count: m - k + 1)
        for i in 0...m-k {
            for j in 0...n-k {
                var kgrid: [Int] = []
                for x in i..<i+k {
                    for y in j..<j+k {
                        kgrid.append(grid[x][y])
                    }
                }
                var kmin = Int.max
                kgrid.sort()
                for t in 1..<kgrid.count {
                    if kgrid[t] == kgrid[t - 1] {
                        continue
                    }
                    kmin = min(kmin, kgrid[t] - kgrid[t - 1])
                }
                if kmin != Int.max {
                    result[i][j] = kmin
                }
            }
        }
        return result
    }
    
    func tests() {
        print(minAbsDiff([[1,8],[3,-2]], 2)) // [[2]]
        print(minAbsDiff([[3,-1]], 1)) // [[0,0]]
        print(minAbsDiff([[1,-2,3],[2,3,5]], 2)) // [[1,2]]
    }
}
