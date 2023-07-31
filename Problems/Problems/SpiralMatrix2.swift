class SpiralMatrix2 {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        let n = matrix.count
        let m = matrix[0].count
        var i = 0
        var j = 0
        var top = 0
        var bottom = n - 1
        var left = 0
        var right = m - 1
        var dir = (0, 1)
        var result: [Int] = []
        while result.count < n * m {
            while i >= top && i <= bottom && j >= left && j <= right {
                result.append(matrix[i][j])
                i += dir.0
                j += dir.1
            }
            i -= dir.0
            j -= dir.1
            switch dir {
            case (0, 1): dir = (1, 0); top += 1
            case (1, 0): dir = (0, -1); right -= 1
            case (0, -1): dir = (-1, 0); bottom -= 1
            case (-1, 0): dir = (0, 1); left += 1
            default: fatalError()
            }
            i += dir.0
            j += dir.1
        }
        return result
    }
    
    func tests() {
        print(spiralOrder([[1,2,3],[4,5,6],[7,8,9]])) // [1,2,3,6,9,8,7,4,5]
        print(spiralOrder([[1,2,3,4],[5,6,7,8],[9,10,11,12]])) // [1,2,3,4,8,12,11,10,9,5,6,7]
        print(spiralOrder([[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]))
    }
}
