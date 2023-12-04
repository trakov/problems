class MinimumTimeVisitingAllPoints {
    func minTimeToVisitAllPoints(_ points: [[Int]]) -> Int {
        guard points.count > 1 else { return 0 }
        var result = 0
        for (i, point) in points.enumerated().dropFirst() {
            result += max(
                abs(point[0] - points[i - 1][0]),
                abs(point[1] - points[i - 1][1])
            )
        }
        return result
    }
    
    func tests() {
        print(minTimeToVisitAllPoints([[1,1],[3,4],[-1,0]])) // 7
        print(minTimeToVisitAllPoints([[3,2],[-2,2]])) // 5
    }
}

