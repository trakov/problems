class RotateImage {
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        for i in 0..<n/2 {
            for j in 0..<(n-n/2) {
                (
                    matrix[j][n-i-1], // 2
                    matrix[n-i-1][n-j-1], // 3
                    matrix[n-j-1][i], // 4
                    matrix[i][j] // 1
                ) = (
                    matrix[i][j], // 1
                    matrix[j][n-i-1], // 2
                    matrix[n-i-1][n-j-1], // 3
                    matrix[n-j-1][i] // 4
                )
            }
        }
    }

    func rotate2(_ matrix: inout [[Int]]) {
        let n = matrix.count
        for r in 0..<n/2 {
            for i in r..<n-r-1 {
                (matrix[r][i], matrix[i][n-r-1], matrix[n-r-1][n-i-1], matrix[n-i-1][r]) =
                (matrix[n-i-1][r], matrix[r][i], matrix[i][n-r-1], matrix[n-r-1][n-i-1])
            }
        }
    }

    func tests() {
        var m: [[Int]] = [[1,2,3],[4,5,6],[7,8,9]]
        rotate(&m)
        print(m) // [[7,4,1],[8,5,2],[9,6,3]]
        
        m = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
        rotate(&m)
        print(m) // [[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]

    }
}
