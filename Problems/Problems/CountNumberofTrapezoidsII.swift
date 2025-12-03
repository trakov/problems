final class CountNumberofTrapezoidsII {
    func countTrapezoids(_ points: [[Int]]) -> Int {
        var slopeToIntercept: [Double: [Double]] = [:]
        var midToSlope: [Int: [Double]] = [:]
        var result = 0
        for (i, point) in points.enumerated() {
            let (x1, y1) = (point[0], point[1])
            for point in points.dropFirst(i + 1) {
                let (x2, y2) = (point[0], point[1])
                let (dx, dy) = (x1 - x2, y1 - y2)
                var (k, b) = (0.0, 0.0)
                if x2 == x1 {
                    k = .infinity
                    b = Double(x1)
                } else {
                    k = Double(dy) / Double(dx)
                    b = (Double(y1) * Double(dx) - Double(x1) * Double(dy)) / Double(dx)
                }
                let mid = (x1 + x2) * 10000 + y1 + y2
                slopeToIntercept[k, default: []].append(b)
                midToSlope[mid, default: []].append(k)
            }
        }
        for sti in slopeToIntercept.values where sti.count != 1 {
            var cnt: [Double: Int] = [:]
            for b in sti {
                cnt[b, default: 0] += 1
            }
            var sum = 0
            for count in cnt.values {
                result += sum * count
                sum += count
            }
        }
        for mts in midToSlope.values where mts.count != 1 {
            var cnt: [Double: Int] = [:]
            for k in mts {
                cnt[k, default: 0] += 1
            }
            var sum = 0
            for count in cnt.values {
                result -= sum * count
                sum += count
            }
        }
        return result
    }
    
    func tests() {
        print(countTrapezoids([[-3,2],[3,0],[2,3],[3,2],[2,-3]])) // 2
        print(countTrapezoids([[0,0],[1,0],[0,1],[2,1]])) // 1
    }
}
