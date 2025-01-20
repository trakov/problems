class FirstCompletelyPaintedRoworColumn {
    func firstCompleteIndex(_ arr: [Int], _ mat: [[Int]]) -> Int {
        let n = mat.count
        let m = mat[0].count
        var rows = Array(repeating: 0, count: n)
        var cols = Array(repeating: 0, count: m)
        var map: [Int: (Int, Int)] = [:]
        for (i, row) in mat.enumerated() {
            for (j, val) in row.enumerated() {
                rows[i] += val
                cols[j] += val
                map[val] = (i, j)
            }
        }
        for (k, val) in arr.enumerated() {
            let (i, j) = map[val]!
            rows[i] -= val
            cols[j] -= val
            if rows[i] == 0 || cols[j] == 0 {
                return k
            }
        }
        return -1
    }
    
    func tests() {
        print(firstCompleteIndex([1,3,4,2], [[1,4],[2,3]])) // 2
        print(firstCompleteIndex([2,8,7,4,1,3,5,6,9], [[3,2,5],[1,4,6],[8,7,9]])) // 3
    }
}

