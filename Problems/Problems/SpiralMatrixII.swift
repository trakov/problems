class SpiralMatrixII {
    enum Direction: Int {
        case right
        case bottom
        case left
        case top
        mutating func turnNext() {
            self = Direction(rawValue: (self.rawValue + 1) % 4)!
        }
    }

    func generateMatrix(_ n: Int) -> [[Int]] {
        guard n > 1 else { return [[1]] }
        var result = Array(repeating: Array(repeating: 1, count: n), count: n)
        var value = 1
        var count = (n, n, true)
        var row = 0
        var col = 0
        var dir: Direction = .right
        while value <= n * n {
            result[row][col] = value
            if value == count.0 {
                dir.turnNext()
                if count.2 {
                    count.1 -= 1
                    count.2 = false
                } else {
                    count.2 = true
                }
                count.0 += count.1
            }
            switch dir {
            case .right: col += 1
            case .bottom: row += 1
            case .left: col -= 1
            case .top: row -= 1
            }
            value += 1
        }
        return result
    }
    
    func tests() {
        print(generateMatrix(3)) // [[1,2,3],[8,9,4],[7,6,5]]
        print(generateMatrix(1)) // [[1]]
    }
}

