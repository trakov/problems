class CountSquareSubmatriceswithAllOnes {
    func countSquares(_ matrix: [[Int]]) -> Int {
        let n = matrix.count
        let m = matrix[0].count
        var result = 0
        var dp = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
        for i in 0..<n {
            for j in 0..<m where matrix[i][j] == 1 {
                dp[i + 1][j + 1] = min(dp[i][j + 1], dp[i + 1][j], dp[i][j]) + 1
                result += dp[i + 1][j + 1]
            }
        }
        return result
    }
    
    func tests() {
        print(countSquares([
            [0,1,1,1],
            [1,1,1,1],
            [0,1,1,1]
          ])) // 15
        print(countSquares([
            [1,0,1],
            [1,1,0],
            [1,1,0]
          ])) // 7
    }
}

