class ChampagneTower {
    func champagneTower(_ poured: Int, _ query_row: Int, _ query_glass: Int) -> Double {
        var result = Array(
            repeating: Array(repeating: 0.0, count: query_row + 2), count: query_row + 2
        )
        result[0][0] = Double(poured)
        for r in 0...query_row {
            for c in 0...r {
                let q = (result[r][c] - 1.0) / 2.0
                if q > 0 {
                    result[r + 1][c] += q
                    result[r + 1][c + 1] += q
                }
            }
        }

        return min(1, result[query_row][query_glass])
    }
    
    func tests() {
        print(champagneTower(1, 1, 1)) // 0.0
        print(champagneTower(2, 1, 1)) // 0.5
        print(champagneTower(100000009, 33, 17)) // 1.0
    }
}

