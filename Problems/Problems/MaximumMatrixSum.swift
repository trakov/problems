class MaximumMatrixSum {
    func maxMatrixSum(_ matrix: [[Int]]) -> Int {
        var absSum = 0
        var hasZero = false
        var negativeCount = 0
        var absMin = Int.max
        for row in matrix {
            for val in row {
                if val == 0 {
                    hasZero = true
                } else if val < 0 {
                    negativeCount += 1
                }
                absSum += abs(val)
                absMin = min(absMin, abs(val))
            }
        }
        if hasZero { return absSum }
        if negativeCount % 2 == 0 { return absSum }
        return absSum - 2 * absMin
    }
    
    func tests() {
        print(maxMatrixSum([[1,-1],[-1,1]])) // 4
        print(maxMatrixSum([[1,2,3],[-1,-2,-3],[1,2,3]])) // 16
    }
}

