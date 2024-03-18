class MinimumNumberOfArrowsToBurstBalloons {
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        guard !points.isEmpty else { return 0 }
        var points = points.sorted { $0[1] < $1[1] }
        var result = 1
        var end = points[0][1]
        for point in points where end < point[0] {
            result += 1
            end = point[1]
        }
        return result
    }
    
    func tests() {
        print(findMinArrowShots([[10,16],[2,8],[1,6],[7,12]])) // 2
        print(findMinArrowShots([[1,2],[3,4],[5,6],[7,8]])) // 4
        print(findMinArrowShots([[1,2],[2,3],[3,4],[4,5]])) // 2
    }
}

