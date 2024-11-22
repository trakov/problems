class FlipColumnsForMaximumNumberofEqualRows {
    func maxEqualRowsAfterFlips(_ matrix: [[Int]]) -> Int {
        var map: [String: Int] = [:]
        for row in matrix {
            var pattern = ""
            for val in row {
                if row[0] == val {
                    pattern.append("T")
                } else {
                    pattern.append("F")
                }
            }
            map[pattern, default: 0] += 1
        }
        return map.values.max()!
    }
    
    func tests() {
        print(maxEqualRowsAfterFlips([[0,1],[1,1]])) // 1
        print(maxEqualRowsAfterFlips([[0,1],[1,0]])) // 2
        print(maxEqualRowsAfterFlips([[0,0,0],[0,0,1],[1,1,0]])) // 2
    }
}

