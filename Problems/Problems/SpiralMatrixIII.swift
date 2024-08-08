class SpiralMatrixIII {
    func spiralMatrixIII(
        _ rows: Int, _ cols: Int, _ rStart: Int, _ cStart: Int
    ) -> [[Int]] {
        
        var result: [[Int]] = [[rStart, cStart]]
        
        func appendToResult(_ i: Int, _ j: Int) {
            guard i >= 0 && i < rows && j >= 0 && j < cols else { return }
            result.append([i, j])
        }
        
        var (i, j) = (rStart, cStart)
        var (dx, dy) = (0, 1)
        var dirCount = 1
        var curCount = 0
        while result.count < rows * cols {
            i += dx
            j += dy
            appendToResult(i, j)
            curCount += 1
            guard dirCount == curCount else { continue }
            if dy == 0 {
                dirCount += 1
                (dx, dy) = (0, -dx)
            } else {
                (dx, dy) = (dy, 0)
            }
            curCount = 0
        }
        
        return result
    }
    
    func tests() {
        print(spiralMatrixIII(1, 4, 0, 0)) // [[0,0],[0,1],[0,2],[0,3]]
        print(spiralMatrixIII(5, 6, 1, 4))
        //[[1,4],[1,5],[2,5],[2,4],[2,3],[1,3],[0,3],[0,4],[0,5],[3,5],[3,4],[3,3],[3,2],[2,2],[1,2],[0,2],[4,5],[4,4],[4,3],[4,2],[4,1],[3,1],[2,1],[1,1],[0,1],[4,0],[3,0],[2,0],[1,0],[0,0]]
    }
}

