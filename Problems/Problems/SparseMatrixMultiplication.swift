class SparseMatrixMultiplication {
    func mult(_ mat1: [[Int]], _ mat2: [[Int]]) -> [[Int]] {
        let n = mat1.count
        let k = mat2.count
        let m = mat2[0].count
        var result = Array(
            repeating: Array(repeating: 0, count: m), count: n
        )
        for i in 0..<n {
            for j in 0..<m {
                for l in 0..<k {
                    result[i][j] += mat1[i][l] * mat2[l][j]
                }
            }
        }
        return result
    }
    
    func tests() {
        print(mult([[1,0,0],[-1,0,3]], [[7,0,0],[0,0,0],[0,0,1]]))
        // [[7,0,0],[-7,0,3]]
        print(mult([[0]], [[0]])) // [[0]]
    }
}

