final class MaximumSideLengthofaSquarewithSumLessthanorEqualtoThreshold {
    func maxSideLength(_ mat: [[Int]], _ threshold: Int) -> Int {
        let (n, m) = (mat.count, mat[0].count)
        var sumMat = Array(repeating: Array(repeating: 0, count: m+1), count: n+1)
        var result = 0
        for (i, row) in mat.enumerated() {
            for (j, val) in row.enumerated() {
                if val <= threshold { result = 1 }
                sumMat[i+1][j+1] = val + sumMat[i+1][j] + sumMat[i][j+1] - sumMat[i][j]
            }
        }
        guard result == 1 else { return 0 }
        let top = min(n, m)
        guard top > 1 else { return result }
        func check(_ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int) -> Int {
            sumMat[x2][y2] - sumMat[x1 - 1][y2] - sumMat[x2][y1 - 1] + sumMat[x1 - 1][y1 - 1]
        }
        for i in 1...n {
            for j in 1...n {
                guard result < top else { return result }
                for c in result+1...top {
                    guard i + c - 1 <= n, j + c - 1 <= m,
                       check(i, j, i + c - 1, j + c - 1) <= threshold else {
                        break
                    }
                    result += 1
                }
            }
        }
        return result
    }
    
    func tests() {
        print(maxSideLength([[1,1,3,2,4,3,2],[1,1,3,2,4,3,2],[1,1,3,2,4,3,2]], 4)) // 2
        print(maxSideLength([[2,2,2,2,2],[2,2,2,2,2],[2,2,2,2,2],[2,2,2,2,2],[2,2,2,2,2]], 1)) // 0
        print(maxSideLength([[18,70],[61,1],[25,85],[14,40],[11,96],[97,96],[63,45]], 40184)) //
    }
}
