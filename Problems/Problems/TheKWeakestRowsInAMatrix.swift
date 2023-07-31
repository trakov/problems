class TheKWeakestRowsInAMatrix {
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        var rows: [(Int, Int)] = Array(repeating: (0,0), count: mat.count)
        for (i, row) in mat.enumerated() {
            rows[i] = (i, row.reduce(0, +))
        }
        rows.sort { r1, r2 in
            if r1.1 < r2.1 {
                return true
            }
            return r1.0 < r2.0
        }
        
        return rows[0..<k].map { $0.0 }
    }

    func tests() {
        print(kWeakestRows([[1,1,0,0,0],
                            [1,1,1,1,0],
                            [1,0,0,0,0],
                            [1,1,0,0,0],
                            [1,1,1,1,1]], 3)) // 2,0,3
        print(kWeakestRows([[1,0,0,0],
                            [1,1,1,1],
                            [1,0,0,0],
                            [1,0,0,0]], 2)) // 0,2
    }
}
