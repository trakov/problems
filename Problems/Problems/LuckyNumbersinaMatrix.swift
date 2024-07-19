class LuckyNumbersinaMatrix {
    func luckyNumbers(_ matrix: [[Int]]) -> [Int] {
        let n = matrix.count
        let m = matrix[0].count
        var mins = Array(repeating: Int.max, count: n)
        var maxs = Array(repeating: Int.min, count: m)
        for (i, row) in matrix.enumerated() {
            for (j, val) in row.enumerated() {
                mins[i] = min(mins[i], val)
                maxs[j] = max(maxs[j], val)
            }
        }
        return Array(Set(mins).intersection(maxs))
    }

    func tests() {
        print(luckyNumbers([[3,7,8],[9,11,13],[15,16,17]])) // [15]
        print(luckyNumbers([[1,10,4,2],[9,3,8,7],[15,16,17,12]])) // [12]
        print(luckyNumbers([[7,8],[1,2]])) // [7]
    }
}

