class FindValidMatrixGivenRowandColumnSums {
    func restoreMatrix(_ rowSum: [Int], _ colSum: [Int]) -> [[Int]] {
        let n = rowSum.count
        let m = colSum.count
        var rowSum = rowSum
        var colSum = colSum
        var result = Array(repeating: Array(repeating: 0, count: m), count: n)
        for i in 0..<n {
            for j in 0..<m {
                let val = min(rowSum[i], colSum[j])
                result[i][j] = val
                rowSum[i] -= val
                colSum[j] -= val
            }
        }
        return result
    }
    
    func tests() {
        print(restoreMatrix([3,8], [4,7])) //[[3,0], [1,7]]
        print(restoreMatrix([5,7,10], [8,6,8])) //[[0,5,0], [6,1,0], [2,0,8]]
    }
}

