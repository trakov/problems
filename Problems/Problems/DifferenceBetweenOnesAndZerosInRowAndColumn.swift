class DifferenceBetweenOnesAndZerosInRowAndColumn {
    func onesMinusZeros(_ grid: [[Int]]) -> [[Int]] {
        let n = grid.count
        let m = grid[0].count
        var col = Array(repeating: 0, count: n)
        var row = Array(repeating: 0, count: m)
        for i in 0..<n {
            for j in 0..<m {
                let val = grid[i][j] == 0 ? -1 : 1
                col[i] += val
                row[j] += val
            }
        }
        var result = grid
        for i in 0..<n {
            for j in 0..<m {
                result[i][j] = col[i] + row[j]
            }
        }
        return result
    }
    
    func tests() {
        print(onesMinusZeros([[0,1,1],[1,0,1],[0,0,1]]))
        // [[0,0,4],[0,0,4],[-2,-2,2]]
        print(onesMinusZeros([[1,1,1],[1,1,1]])) // [[5,5,5],[5,5,5]]
        
    }
}

