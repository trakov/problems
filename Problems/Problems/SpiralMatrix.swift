class SpiralMatrix {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        let n = matrix.count
        let m = matrix[0].count
        var result = Array(repeating: 0, count: n * m)
        var left = 0
        var right = m - 1
        var top = 0
        var bottom = n - 1
        var k = 0
        while true {
            for i in stride(from: left, through: right, by: 1) {
                result[k] = matrix[top][i]
                k += 1
            }
            guard k < n * m else { break }
            top += 1
            for i in stride(from: top, through: bottom, by: 1) {
                result[k] = matrix[i][right]
                k += 1
            }
            guard k < n * m else { break }
            right -= 1
            for i in stride(from: right, through: left, by: -1) {
                result[k] = matrix[bottom][i]
                k += 1
            }
            guard k < n * m else { break }
            bottom -= 1
            for i in stride(from: bottom, through: top, by: -1) {
                result[k] = matrix[i][left]
                k += 1
            }
            guard k < n * m else { break }
            left += 1
        }
        return result
    }
    
    func spiralOrder1(_ matrix: [[Int]]) -> [Int] {
        let m = matrix.count
        guard let n = matrix.first?.count else { return [] }
        var x = 0
        var y = 0
        var result: [Int] = []
        var x1 = 0
        var y1 = 0
        var x2 = n - 1
        var y2 = m - 1
        while result.count < n * m {
            if x1 == x && y1 == y {
                for i in x1...x2 {
                    result.append(matrix[y][i])
                }
                y1 += 1
                x = x2
                y = y1
            } else
            if x2 == x && y1 == y {
                for i in y1...y2 {
                    result.append(matrix[i][x])
                }
                x2 -= 1
                x = x2
                y = y2
            } else
            if x2 == x && y2 == y {
                for i in (x1...x2).reversed() {
                    result.append(matrix[y][i])
                }
                y2 -= 1
                x = x1
                y = y2
            } else
            if x1 == x && y2 == y {
                for i in (y1...y2).reversed() {
                    result.append(matrix[i][x])
                }
                x1 += 1
                x = x1
                y = y1
            }
        }
        return result
    }
    
    func tests() {
        print(spiralOrder([[1,2,3],[4,5,6],[7,8,9]])) // [1,2,3,6,9,8,7,4,5]
        print(spiralOrder([[1,2,3,4],[5,6,7,8],[9,10,11,12]])) // [1,2,3,4,8,12,11,10,9,5,6,7]
        print(spiralOrder([[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]))
    }
}
