class MaximumNumberofPointswithCost {
    func maxPoints(_ points: [[Int]]) -> Int {
        var result = points[0]
        for row in points.dropFirst() {
            var next = result
            var runningMax = 0
            // Left to right pass
            for (i, val) in row.enumerated() {
                runningMax = max(runningMax - 1, result[i])
                next[i] = runningMax
            }
            runningMax = 0
            // Right to left pass
            for (i, val) in row.enumerated().reversed() {
                runningMax = max(runningMax - 1, result[i])
                next[i] = max(next[i], runningMax) + val
            }
            result = next
        }
        return result.max()!
    }
    
    func maxPoints2(_ points: [[Int]]) -> Int {
        var result = points[0]
        for row in points.dropFirst() {
            var next = result
            for (i, val) in row.enumerated() {
                for (j, res) in result.enumerated() {
                    next[i] = max(next[i], res + val - abs(i - j))
                }
            }
            result = next
        }
        return result.max()!
    }
    
    func tests() {
        print(maxPoints([[1,2,3],[1,5,1],[3,1,1]])) // 9
        print(maxPoints([[1,5],[2,3],[4,2]])) // 11
        print(maxPoints([[1,5],[3,2],[4,2]])) // 11
    }
}

