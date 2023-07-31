class NonOverlappingIntervals {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        guard intervals.count > 1 else { return 0 }
        let intervals = intervals.sorted { a, b in
//            guard a[0] == b[0] else {
//                return a[0] < b[0]
//            }
            return a[1] < b[1]
        }
        var result = 0
        var right = Int.min
        for interval in intervals {
            if interval[0] < right {
                result += 1
            } else {
                right = interval[1]
            }
        }
        return result
    }
    
    func eraseOverlapIntervals2(_ intervals: [[Int]]) -> Int {
        guard intervals.count > 1 else { return 0 }
        let intervals = intervals.sorted { a, b in
            guard a[0] != b[0] else { return a[1] < b[1] }
            return a[0] < b[0]
        }
        var result = 0
        
        var prev = intervals[0]
        for interval in intervals.dropFirst() {
            if prev[1] > interval[0] && prev[0] < interval[1] {
                result += 1
                if interval[1] < prev[1] {
                    prev = interval
                }
            } else {
                prev = interval
            }
        }
        
        return result
    }
    
    func tests() {
        print(eraseOverlapIntervals([[-52,31],[-73,-26],[82,97],[-65,-11],[-62,-49],[95,99],[58,95],[-31,49],[66,98],[-63,2],[30,47],[-40,-26]])) // 7
        print(eraseOverlapIntervals([[1,2],[2,3],[3,4],[1,3]])) // 1
        print(eraseOverlapIntervals([[1,2],[1,2],[1,2]])) // 2
        print(eraseOverlapIntervals([[1,2],[2,3]])) // 0
    }
}

