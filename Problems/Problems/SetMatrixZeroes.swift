class SetMatrixZeroes {
    func setZeroes(_ matrix: inout [[Int]]) {
        let n = matrix.count
        let m = matrix[0].count
        var zeroRow = false
        var zeroCol = false
        // should first column be zero
        for i in 0..<n where matrix[i][0] == 0 {
            zeroCol = true
            break
        }
        // should first row be zero
        for j in 0..<m where matrix[0][j] == 0 {
            zeroRow = true
            break
        }
        // zero values in the first col and first row
        for i in 1..<n {
            for j in 1..<m where matrix[i][j] == 0 {
                matrix[i][0] = 0
                matrix[0][j] = 0
            }
        }
        // zero others elements if their first col or row element is zero
        for i in 1..<n {
            for j in 1..<m where matrix[i][0] == 0 || matrix[0][j] == 0 {
                matrix[i][j] = 0
            }
        }
        // zero first column if needed
        if zeroCol {
            for i in 0..<n {
                matrix[i][0] = 0
            }
        }
        // zero first column if needed
        if zeroRow {
            for j in 0..<m {
                matrix[0][j] = 0
            }
        }
    }
    
    func setZeroes1(_ matrix: inout [[Int]]) {
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

