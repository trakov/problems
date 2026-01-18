final class LargestMagicSquare {
    func largestMagicSquare(_ grid: [[Int]]) -> Int {
        let (m, n) = (grid.count, grid[0].count)
        guard min(m, n) > 1 else { return 1 }
        var rowsum = Array(repeating: Array(repeating: 0, count: n), count: m)
        for i in 0..<m {
            rowsum[i][0] = grid[i][0]
            for j in 1..<n {
                rowsum[i][j] = rowsum[i][j - 1] + grid[i][j]
            }
        }
        var colsum = Array(repeating: Array(repeating: 0, count: n), count: m)
        for j in 0..<n {
            colsum[0][j] = grid[0][j]
            for i in 1..<m {
                colsum[i][j] = colsum[i - 1][j] + grid[i][j]
            }
        }
        for edge in (2...min(m, n)).reversed() {
            for i in 0...m-edge {
                for j in 0...n-edge {
                    let stdsum = rowsum[i][j + edge - 1] - (j > 0 ? rowsum[i][j - 1] : 0)
                    var check = true
                    for ii in i+1..<i+edge {
                        if rowsum[ii][j + edge - 1] - (j > 0 ? rowsum[ii][j - 1] : 0) != stdsum {
                            check = false
                            break
                        }
                    }
                    guard check else { continue }
                    for jj in j..<j+edge {
                        if colsum[i + edge - 1][jj] - (i > 0 ? colsum[i - 1][jj] : 0) != stdsum {
                            check = false
                            break
                        }
                    }
                    guard check else { continue }
                    var d1 = 0
                    var d2 = 0
                    for k in 0..<edge {
                        d1 += grid[i + k][j + k]
                        d2 += grid[i + k][j + edge - 1 - k]
                    }
                    if d1 == stdsum && d2 == stdsum {
                        return edge
                    }
                }
            }
        }
        return 1
    }
    
    func tests() {
        print(largestMagicSquare([[7,1,4,5,6],[2,5,1,6,4],[1,5,4,3,2],[1,2,7,3,4]])) // 3
        print(largestMagicSquare([[5,1,3,1],[9,3,3,1],[1,3,3,8]])) // 2
    }
}
