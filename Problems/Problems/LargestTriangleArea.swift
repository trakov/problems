final class LargestTriangleArea {
    func largestTriangleArea(_ points: [[Int]]) -> Double {
        func area(_ a: [Int], _ b: [Int], _ c: [Int]) -> Double {
            abs(Double(
                (b[0] - a[0]) * (c[1] - a[1]) - (c[0] - a[0]) * (b[1] - a[1])
            )) / 2.0
        }
        let n = points.count
        var result = 0.0
        for a in points[0..<n-2] {
            for b in points[1..<n-1] {
                for c in points[2..<n] {
                    result = max(result, area(a, b, c))
                }
            }
        }
        return result
    }
    
    func tests() {
        print(largestTriangleArea([[0,0],[0,1],[1,0],[0,2],[2,0]])) // 2.0
        print(largestTriangleArea([[1,0],[0,0],[0,1]])) // 0.5
        print(largestTriangleArea([[10,7],[0,4],[5,7]])) // 7.5
    }
}
