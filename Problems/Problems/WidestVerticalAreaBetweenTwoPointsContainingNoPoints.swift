class WidestVerticalAreaBetweenTwoPointsContainingNoPoints {
    func maxWidthOfVerticalArea(_ points: [[Int]]) -> Int {
        let points = points.map { $0[0] }.sorted()
        var result = 0
        for i in 1..<points.count {
            result = max(result, points[i] - points[i - 1])
        }
        return result
    }
    
    func tests() {
        print(maxWidthOfVerticalArea([[8,7],[9,9],[7,4],[9,7]])) // 1
        print(maxWidthOfVerticalArea([[3,1],[9,0],[1,0],[1,4],[5,3],[8,8]])) // 3
    }
}

