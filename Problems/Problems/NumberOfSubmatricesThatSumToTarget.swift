class NumberOfSubmatricesThatSumToTarget {
    func numSubmatrixSumTarget(_ matrix: [[Int]], _ target: Int) -> Int {
        let m = matrix.count
        let n = matrix[0].count
        var matrix = matrix
        for row in 0..<m {
            for col in 1..<n {
                matrix[row][col] += matrix[row][col - 1]
            }
        }
        var result = 0
        for c1 in 0..<n {
            for c2 in c1..<n {
                var map: [Int: Int] = [0:1]
                var sum = 0
                for row in 0..<m {
                    sum += matrix[row][c2] - (c1 > 0 ? matrix[row][c1 - 1] : 0)
                    result += map[sum - target] ?? 0
                    map[sum, default: 0] += 1
                }
            }
        }
        return result
    }
    
    func tests() {
        print(numSubmatrixSumTarget([[0,1,0],[1,1,1],[0,1,0]], 0)) // 4
        print(numSubmatrixSumTarget([[1,-1],[-1,1]], 0)) // 5
        print(numSubmatrixSumTarget([[904]], 0)) // 0
        print(numSubmatrixSumTarget([[1,0,-1],[0,-1,0]], 0)) // 5
    }
}

