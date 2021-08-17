class MergeIntervals {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let sorted = intervals.sorted { first, second in
            return first[0] <= second[0]
        }
        var result = [[Int]]()
        var left = sorted[0][0]
        var right = sorted[0][1]
        for interval in sorted {
            if interval[0] <= right {
                right = max(right, interval[1])
            } else {
                result.append([left, right])
                left = interval[0]
                right = interval[1]
            }
        }
        result.append([left, right])
        return result
    }

    func tests() {
        print(merge([[1,3],[2,6],[8,10],[15,18]]))//[[1,6],[8,10],[15,18]]
        print(merge([[1,4],[4,5]]))//[[1,5]]
    }
}

