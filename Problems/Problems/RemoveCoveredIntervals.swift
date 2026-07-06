final class RemoveCoveredIntervals {
    func removeCoveredIntervals(_ intervals: [[Int]]) -> Int {
        let intervals = intervals.sorted {
            if $0[0] == $1[0] {
                return $0[1] > $1[1]
            }
            return $0[0] < $1[0]
        }
        var result = 0
        var maxRight = Int.min
        for interval in intervals {
            let right = interval[1]
            if right > maxRight {
                result += 1
                maxRight = right
            }
        }
        return result
    }
    
    func tests() {
        print(removeCoveredIntervals([[1,4],[3,6],[2,8]])) // 2
        print(removeCoveredIntervals([[1,4],[2,3]])) // 1
    }
}
