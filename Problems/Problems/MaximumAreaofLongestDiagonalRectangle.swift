final class MaximumAreaofLongestDiagonalRectangle {
    func areaOfMaxDiagonal(_ dimensions: [[Int]]) -> Int {
        var result = 0
        var diag = 0
        for dim in dimensions {
            let (x, y) = (dim[0], dim[1])
            let d = x * x + y * y
            if d > diag {
                diag = d
                result = x * y
            } else if d == diag {
                result = max(result, x * y)
            }
        }
        return result
    }
    
    func tests() {
        print(areaOfMaxDiagonal([[9,3],[8,6]])) // 48
        print(areaOfMaxDiagonal([[3,4],[4,3]])) // 12
    }
}
