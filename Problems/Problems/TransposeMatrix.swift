class TransposeMatrix {
    func transpose(_ matrix: [[Int]]) -> [[Int]] {
        let n = matrix.count
        let m = matrix[0].count
        var result = Array(repeating: Array(repeating: 0, count: n), count: m)
        for i in 0..<n {
            for j in 0..<m {
                result[j][i] = matrix[i][j]
            }
        }
        return result
    }
    
    func tests() {
        print(transpose([[1,2,3],[4,5,6],[7,8,9]]))
        // [[1,4,7],[2,5,8],[3,6,9]]
        print(transpose([[1,2,3],[4,5,6]])) // [[1,4],[2,5],[3,6]]
    }
}

