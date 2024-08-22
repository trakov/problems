class DiagonalTraverse {
    func findDiagonalOrder(_ mat: [[Int]]) -> [Int] {
        let n = mat.count
        let m = mat[0].count
        var result = Array(repeating: 0, count: n * m)
        var k = 0
        var i = 0
        var j = 0
        var dir = 0
        while true {
            result[k] = mat[i][j]
            if i == n-1 && j == m-1 { break }
            if dir == 0 {
                if i > 0 && j < m - 1 {
                    i -= 1
                    j += 1
                } else {
                    if j == m - 1 {
                        i += 1
                    } else {
                        j += 1
                    }
                    dir = 1
                }
            } else {
                if i < n - 1 && j > 0 {
                    i += 1
                    j -= 1
                } else {
                    if i == n - 1 {
                        j += 1
                    } else {
                        i += 1
                    }
                    dir = 0
                }
            }

            k += 1
        }
        return result
    }
    
    func tests() {
        print(findDiagonalOrder([[1,2,3],[4,5,6],[7,8,9]])) // [1,2,4,7,5,3,6,8,9]
        print(findDiagonalOrder([[1,2],[3,4]])) // [1,2,3,4]
    }
}

