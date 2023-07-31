class SpiralMatrixIV {
    enum Direction: Int {
        case right
        case bottom
        case left
        case top
        mutating func turn() {
            self = Direction(rawValue: (rawValue + 1) % 4 )!
        }
    }
    
    func spiralMatrix(_ m: Int, _ n: Int, _ head: ListNode?) -> [[Int]] {
        var result = Array(repeating: Array(repeating: -1, count: n), count: m)
        var node = head
        var i = 0
        var j = 0
        var boundaries = (top: 0, left: 0, bottom: m-1, right: n-1)
        var dir: Direction = .right
        while node != nil {
            result[i][j] = node!.val
            switch dir {
            case .right:
                if j == boundaries.right {
                    boundaries.top += 1
                    dir.turn()
                }
            case .bottom:
                if i == boundaries.bottom {
                    boundaries.right -= 1
                    dir.turn()
                }
            case .left:
                if j == boundaries.left {
                    boundaries.bottom -= 1
                    dir.turn()
                }
            case .top:
                if i == boundaries.top {
                    boundaries.left += 1
                    dir.turn()
                }
            }
            switch dir {
            case .right: j += 1
            case .bottom: i += 1
            case .left: j -= 1
            case .top: i -= 1
            }
            node = node?.next
        }
        
        return result
    }
    
    func tests() {
        print(spiralMatrix(3, 5, [3,0,2,6,8,1,7,9,4,2,5,5,0])) //
        print(spiralMatrix(1, 4, [0,1,2]))
    }
}

