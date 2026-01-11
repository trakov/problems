class MaximalRectangle {
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        if matrix.count == 0 || matrix[0].count == 0 { return 0 }
        func helper(_ i: Int, _ j: Int, _ maxI: Int, _ maxJ: Int) -> Int {
            if matrix[i][j] == "0" || maxI == i || maxJ == j { return 0 }
            var x = -1
            var y = -1
            var found = false
            for row in i..<maxI {
                if found { break }
                for col in j..<maxJ where matrix[row][col] == "0" {
                    x = row
                    y = col
                    found = true
                    break
                }
            }
            if x >= 0 {
                return Swift.max(helper(i, j, x, maxJ), helper(i, j, maxI, y))
            } else {
                return (maxI - i) * (maxJ - j)
            }
        }
        var max = 0
        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                let area = helper(i, j, matrix.count,  matrix[0].count)
                max = max > area ? max : area
            }
        }
        return max
    }

    func tests() {
        print(maximalRectangle([["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]))
        // 6
        print(maximalRectangle([["0"]])) // 0
        print(maximalRectangle([["1"]])) // 1
    }
}

