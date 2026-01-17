final class FindtheLargestAreaofSquareInsideTwoRectangles {
    func largestSquareArea(_ bottomLeft: [[Int]], _ topRight: [[Int]]) -> Int {
        var result = 0
        for (i, (l1, r1)) in zip(bottomLeft, topRight).enumerated().dropLast() {
            for (l2, r2) in zip(bottomLeft, topRight).dropFirst(i + 1) {
                guard l1[0] <= r2[0], l1[1] <= r2[1], l2[0] <= r1[0], l2[1] <= r1[1] else { continue }
                let minX = max(l1[0], l2[0])
                let maxX = min(r1[0], r2[0])
                let minY = max(l1[1], l2[1])
                let maxY = min(r1[1], r2[1])
                let side = min(maxX - minX, maxY - minY)
                result = max(result, side * side)
            }
        }
        return result
    }
    
    func tests() {
        print(largestSquareArea([[1,1],[2,2],[3,1]], [[3,3],[4,4],[6,6]])) // 1
        print(largestSquareArea([[1,1],[1,3],[1,5]], [[5,5],[5,7],[5,9]])) // 4
        print(largestSquareArea([[1,1],[2,2],[1,2]], [[3,3],[4,4],[3,4]])) // 1
        print(largestSquareArea([[1,1],[3,3],[3,1]], [[2,2],[4,4],[4,2]])) // 0
    }
}
