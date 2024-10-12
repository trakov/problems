class DivideIntervalsIntoMinimumNumberofGroups {
    func minGroups(_ intervals: [[Int]]) -> Int {
        let mappedIntervals = intervals.flatMap {
            [($0[0], 1), ($0[1] + 1, -1)]
        }
        let dict: [Int: Int] = Dictionary(mappedIntervals, uniquingKeysWith: +)
        var overlaps = 0
        var maxOverlaps = 0
        for key in dict.keys.sorted() {
            overlaps += dict[key]!
            maxOverlaps = max(maxOverlaps, overlaps)
        }
        return maxOverlaps
    }
    
    func tests() {
        print(minGroups([[5,10],[6,8],[1,5],[2,3],[1,10]])) // 3
        print(minGroups([[1,3],[5,6],[8,10],[11,13]])) // 1
    }
}

