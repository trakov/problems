class ReshapeTheMatrix {
    func matrixReshape(_ mat: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
        guard mat.count * mat[0].count == r * c else { return mat }
        if mat.count == r { return mat }
        var result = Array(repeating: Array(repeating: 0, count: c), count: r)
        for (i, row) in mat.enumerated() {
            for (j, value) in row.enumerated() {
                let index = i * row.count + j
                result[index / c][index % c] = value
            }
        }
        return result
    }

    func tests() {
        print(matrixReshape([[1,2],[3,4],[5,6]], 2, 3)) // [[1,2,3],[4,5,6]]
        print(matrixReshape([[1,2],[3,4]], 1, 4)) // [[1,2,3,4]]
        print(matrixReshape([[1,2],[3,4]], 2, 2)) // [[1,2],[3,4]]
    }
}
