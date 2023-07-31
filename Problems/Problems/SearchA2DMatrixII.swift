class SearchA2DMatrixII {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var i = matrix.count - 1
        var j = 0
        while i >= 0 && j < matrix[0].count {
            if matrix[i][j] == target {
                return true
            } else if matrix[i][j] < target {
                j += 1
            } else {
                i -= 1
            }
        }
        return false
    }
    
    func tests() {
        print(searchMatrix(
            [[1,2,3,4,5],[6,7,8,9,10],[11,12,13,14,15],[16,17,18,19,20],[21,22,23,24,25]], 15))
        // true
        print(searchMatrix(
            [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], 5))
        // true
        print(searchMatrix(
            [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], 20))
        // false
    }
}

