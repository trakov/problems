final class FurthestPointFromOrigin {
    func furthestDistanceFromOrigin(_ moves: String) -> Int {
        var (l, r) = (0, 0)
        for move in moves {
            if move == "L" {
                l += 1
            } else if move == "R" {
                r += 1
            }
        }
        let n = moves.count
        return max(n - 2 * l, abs(2 * r - n))
    }
    
    func tests() {
        print(furthestDistanceFromOrigin("L_RL__R")) // 3
        print(furthestDistanceFromOrigin("_R__LL_")) // 5
        print(furthestDistanceFromOrigin("_______")) // 7
    }
}
