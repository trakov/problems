class LargestSubmatrixWithRearrangements {
    func largestSubmatrix(_ matrix: [[Int]]) -> Int {
        let m = matrix.count
        let n = matrix[0].count
        var prevHeights: [(Int, Int)] = []
        var result = 0
        for row in 0..<m {
            var heights: [(Int, Int)] = []
            var seen = Array(repeating: false, count: n)
            for (height, col) in prevHeights where matrix[row][col] == 1 {
                heights.append((height + 1, col))
                seen[col] = true
            }
            for col in 0..<n where seen[col] == false && matrix[row][col] == 1 {
                heights.append((1, col))
            }
            for (i, (height, _)) in heights.enumerated() {
                result = max(result, height * (i + 1))
            }
            prevHeights = heights
        }
        return result
    }
    
    func tests() {
        print(largestSubmatrix([[0,0,1],[1,1,1],[1,0,1]])) // 4
        print(largestSubmatrix([[1,0,1,0,1]])) // 3
        print(largestSubmatrix([[1,1,0],[1,0,1]])) // 2
    }
}

