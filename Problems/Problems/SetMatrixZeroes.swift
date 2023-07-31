class SetMatrixZeroes {
    func setZeroes(_ matrix: inout [[Int]]) {
        var columnsToZero: Set<Int> = []
        let n = matrix.count
        let m = matrix[0].count
        for i in 0..<n {
            var zeroRow = false
            for j in 0..<m {
                if matrix[i][j] == 0 {
                    if !zeroRow {
                        for k in 0..<j {
                            matrix[i][k] = 0
                        }
                    }
                    zeroRow = true
                    columnsToZero.insert(j)
                    for k in 0..<i {
                        matrix[k][j] = 0
                    }
                } else {
                    if zeroRow || columnsToZero.contains(j) {
                        matrix[i][j] = 0
                    }
                }
            }
        }
        
    }
    
    func tests() {
        var mat = [[1,1,1],[1,0,1],[1,1,1]]
        setZeroes(&mat)
        print(mat)// [[1,0,1],[0,0,0],[1,0,1]]
        
        mat = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
        setZeroes(&mat)
        print(mat)// [[0,0,0,0],[0,4,5,0],[0,3,1,0]]
        
    }
}

