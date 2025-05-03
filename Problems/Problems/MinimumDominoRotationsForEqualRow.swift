final class MinimumDominoRotationsForEqualRow {
    func minDominoRotations(_ tops: [Int], _ bottoms: [Int]) -> Int {
        var result = Int.max
        for val in Set([tops[0], bottoms[0]]) {
            var (topSwaps, bottomSwaps) = (0, 0)
            var valid = true
            for (top, bottom) in zip(tops, bottoms) {
                if top != val && bottom != val {
                    valid = false
                    break
                }
                if top != val { topSwaps += 1 }
                if bottom != val { bottomSwaps += 1 }
            }
            if valid {
                result = min(result, topSwaps, bottomSwaps)
            }
        }
        return result == Int.max ? -1 : result
    }
    
    func tests() {
        print(minDominoRotations([2,1,2,4,2,2], [5,2,6,2,3,2])) // 2
        print(minDominoRotations([3,5,1,2,3], [3,6,3,3,4])) // -1
    }
}
