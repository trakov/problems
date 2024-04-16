class MaximalRectangle {
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        let n = matrix.count
        let m = matrix[0].count
        var dp: [(Int, Int)] = Array(repeating: (-1, -1), count: n)
        var result = 0
        for (i, row) in matrix.enumerated() {
            let prevDP = dp
            for (j, val) in row.enumerated() {
                if val == "0" {
                    dp[j] = (-1, -1)
                } else {
                    var temp = 1
                    if prevDP[j].0 != -1 {
                        
                    }
                }
            }
        }
        return result
    }
    
    func tests() {
        print(maximalRectangle([["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]))
        // 6
        print(maximalRectangle([["0"]])) // 0
        print(maximalRectangle([["1"]])) // 1
    }
}

