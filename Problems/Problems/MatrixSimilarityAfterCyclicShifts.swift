final class MatrixSimilarityAfterCyclicShifts {
    func areSimilar(_ mat: [[Int]], _ k: Int) -> Bool {
        let m = mat[0].count
        guard k % m != 0 else { return true }
        let k = k % m
        for (i, row) in mat.enumerated() {
            for (j, val) in row.enumerated() {
                let index = (m + j + (i % 2 == 0 ? -1 : 1) * k) % m
                guard val == row[index] else { return false }
            }
        }
        return true
    }
    
    func tests() {
        print(areSimilar([[1,2,3],[4,5,6],[7,8,9]], 4)) // false
        print(areSimilar([[1,2,1,2],[5,5,5,5],[6,3,6,3]], 2)) // true
        print(areSimilar([[2,2],[2,2]], 3)) // true
    }
}
