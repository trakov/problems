final class SeparateSquaresI {
    func separateSquares(_ squares: [[Int]]) -> Double {
        var (minY, maxY) = (Int.max, 0)
        var total = 0
        for sq in squares {
            let (y, l) = (sq[1], sq[2])
            total += l * l
            minY = min(minY, y)
            maxY = max(maxY, (y + l))
        }
        let halfTotal = Double(total) / 2
        func check(_ limit: Double) -> Bool {
            var area = 0.0
            for sq in squares {
                let (y, l) = (Double(sq[1]), Double(sq[2]))
                if y < limit {
                    area += l * min(limit - y, l)
                }
            }
            return area >= halfTotal
        }

        var lo = Double(minY)
        var hi = Double(maxY)
        let eps = 1e-5
        while abs(hi - lo) > eps {
            let mid = (hi + lo) / 2
            if check(mid) {
                hi = mid
            } else {
                lo = mid
            }
        }
        return hi
    }

    func tests() {
        print(separateSquares([[0,0,1],[2,2,1]])) // 1.00000
        print(separateSquares([[0,0,2],[1,1,1]])) // 1.16667
    }
}
