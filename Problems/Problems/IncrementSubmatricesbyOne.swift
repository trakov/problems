final class IncrementSubmatricesbyOne {
    func rangeAddQueries(_ n: Int, _ queries: [[Int]]) -> [[Int]] {
        var diff = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)
        for q in queries {
            let (x1, y1, x2, y2) = (q[0], q[1], q[2], q[3])
            diff[x1][y1] += 1
            diff[x2 + 1][y1] -= 1
            diff[x1][y2 + 1] -= 1
            diff[x2 + 1][y2 + 1] += 1
        }
        var result = Array(repeating: Array(repeating: 0, count: n), count: n)
        for i in 0..<n {
            for j in 0..<n {
                let x1 = (i == 0) ? 0 : result[i - 1][j]
                let x2 = (j == 0) ? 0 : result[i][j - 1]
                let x3 = (i == 0 || j == 0) ? 0 : result[i - 1][j - 1]
                result[i][j] = diff[i][j] + x1 + x2 - x3
            }
        }
        return result
    }
    
    func tests() {
        print(rangeAddQueries(3, [[1,1,2,2],[0,0,1,1]])) // [[1,1,0],[1,2,1],[0,1,1]]
        print(rangeAddQueries(2, [[0,0,1,1]])) // [[1,1],[1,1]]
    }
}
