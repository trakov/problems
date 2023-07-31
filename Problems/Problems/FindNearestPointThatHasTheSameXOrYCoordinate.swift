class FindNearestPointThatHasTheSameXOrYCoordinate {
    func nearestValidPoint(_ x: Int, _ y: Int, _ points: [[Int]]) -> Int {
        var minDistance = Int.max
        var index = -1
        for (i, point) in points.enumerated() {
            if point[0] == x, abs(point[1] - y) < minDistance {
                minDistance = abs(point[1] - y)
                index = i
            } else if point[1] == y, abs(point[0] - x) < minDistance {
                minDistance = abs(point[0] - x)
                index = i
            }
            if minDistance == 0 { return index }
        }
        return index
    }

    func tests() {
        print(nearestValidPoint(3, 4, [[1,2],[3,1],[2,4],[2,3],[4,4]])) // 2
        print(nearestValidPoint(3, 4, [[3,4]])) // 0
        print(nearestValidPoint(3, 4, [[2,3]])) // -1
    }
}
