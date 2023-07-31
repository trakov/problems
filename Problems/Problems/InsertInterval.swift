class InsertInterval {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        guard intervals.count > 0 else { return [newInterval] }
        var result: [[Int]] = []
        var left: Int? = newInterval[0]
        var right: Int? = newInterval[1]
        for interval in intervals {
            if right ?? Int.max < interval[0] {
                result.append([left!, right!])
                left = nil
                right = nil
                result.append(interval)
                continue
            }
            if left ?? Int.min > interval[1] {
                result.append(interval)
                continue
            }
            left = min(left ?? Int.max, interval[0])
            right = max(right ?? Int.min, interval[1])
        }
        if left != nil, right != nil {
            result.append([left!, right!])
        }
        return result
    }

    func tests() {
        print(insert([[1,3],[6,9]], [2,5])) // [[1,5],[6,9]]
        print(insert([[1,2],[3,5],[6,7],[8,10],[12,16]], [4,8])) // [[1,2],[3,10],[12,16]]
    }
}
