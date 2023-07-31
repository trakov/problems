class RangeSumQuery2DImmutable {
    
    private var sumMatrix: [[Int]]

    init(_ matrix: [[Int]]) {
        sumMatrix = Array(repeating: Array(repeating: 0, count: matrix[0].count), count: matrix.count)
        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                let left = j-1 >= 0 ? sumMatrix[i][j-1] : 0
                let top = i-1 >= 0 ? sumMatrix[i-1][j] : 0
                let topLeft = (j-1 >= 0 && i-1 >= 0) ? sumMatrix[i-1][j-1] : 0
                sumMatrix[i][j] = matrix[i][j] + left + top - topLeft
            }
        }
    }

    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        let left = col1-1 >= 0 ? sumMatrix[row2][col1-1] : 0
        let top = row1-1 >= 0 ? sumMatrix[row1-1][col2] : 0
        let topLeft = (col1-1 >= 0 && row1-1 >= 0) ? sumMatrix[row1-1][col1-1] : 0
        return sumMatrix[row2][col2] - left - top + topLeft
    }

    static func tests() {
        var m = RangeSumQuery2DImmutable([
            [3, 0, 1, 4, 2],
            [5, 6, 3, 2, 1],
            [1, 2, 0, 1, 5],
            [4, 1, 0, 1, 7],
            [1, 0, 3, 0, 5]
        ])
        print(m.sumRegion(2, 1, 4, 3)) // 8
        print(m.sumRegion(1, 1, 2, 2)) // 11
        print(m.sumRegion(1, 2, 2, 4)) // 12
    }
}

