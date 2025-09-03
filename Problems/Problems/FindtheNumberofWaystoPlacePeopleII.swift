final class FindtheNumberofWaystoPlacePeopleII {
    func numberOfPairs(_ points: [[Int]]) -> Int {
        var result = 0
        let points = points.sorted { a, b in
            a[0] != b[0] ? a[0] < b[0] : b[1] < a[1]
        }
        for (i, pointA) in points.enumerated().dropLast() {
            var xMin = pointA[0] - 1
            let xMax = Int.max
            var yMin = Int.min
            let yMax = pointA[1] + 1
            for j in i+1..<points.count {
                let pointB = points[j]
                if pointB[0] > xMin &&
                    pointB[0] < xMax &&
                    pointB[1] > yMin &&
                    pointB[1] < yMax {
                    result += 1
                    xMin = pointB[0]
                    yMin = pointB[1]
                }
            }
        }
        return result
    }
    
    func tests() {
        print(numberOfPairs([[1,1],[2,2],[3,3]])) // 0
        print(numberOfPairs([[6,2],[4,4],[2,6]])) // 2
        print(numberOfPairs([[3,1],[1,3],[1,1]])) // 2
    }
}
