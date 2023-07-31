class MatrixDiagonalSum {
    func diagonalSum(_ mat: [[Int]]) -> Int {
        guard mat.count > 1 else { return mat[0][0] }
        var sum = 0
        for i in 0..<mat.count {
            sum += mat[i][i] + mat[i][mat.count - 1 - i]
        }
        if mat.count % 2 != 0 {
            sum -= mat[mat.count/2][mat.count/2]
        }
        return sum
    }

    func tests() {
        print(diagonalSum([[1,2,3],
                           [4,5,6],
                           [7,8,9]])) // 25
        print(diagonalSum([[1,1,1,1],
                           [1,1,1,1],
                           [1,1,1,1],
                           [1,1,1,1]])) // 8
        print(diagonalSum([[5]])) // 5
    }
}
