import Foundation

class ScoreAfterFlippingMatrix {
    func powerOfTwo(n: Int) -> Double {
        Double(pow(2.0, Double(n)))
    }
    
    func matrixScore(_ grid: [[Int]]) -> Int {
        let n = grid.count
        let m = grid[0].count
        var grid = grid
        var count = Array(repeating: 0, count: m)
        for i in 0..<n where grid[i][0] == 0 {
            for j in 0..<m {
                grid[i][j] = 1 - grid[i][j]
            }
        }
        for i in 0..<n {
            for j in 0..<m {
                count[j] += grid[i][j]
            }
        }
        var result = Double(n) * powerOfTwo(n: m - 1)
        for j in 1..<m {
            count[j] = max(count[j], n - count[j])
            result += Double(count[j]) * powerOfTwo(n: m - j - 1)
        }
        return Int(result)
    }
    
    func tests() {
        print(matrixScore([[0,0,1,1],[1,0,1,0],[1,1,0,0]])) // 39
        print(matrixScore([[0]])) // 1
    }
}

