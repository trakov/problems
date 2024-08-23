class ToeplitzMatrix {
    func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {
        for r in 0..<matrix.count {
            for c in 0..<matrix[0].count {
                if r > 0 && c > 0 && matrix[r-1][c-1] != matrix[r][c] {
                    return false
                }
            }
        }
        return true
    }
    
    func tests() {
        print(isToeplitzMatrix([[1,2,3,4],[5,1,2,3],[9,5,1,2]])) // true
        print(isToeplitzMatrix([[1,2],[2,2]])) // false
    }
}
