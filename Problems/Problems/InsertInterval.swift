class InsertInterval {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        var newInterval = newInterval
        for interval in intervals {
            if newInterval[1] < interval[0] {
                result.append(newInterval)
                newInterval = interval
            } else if interval[1] < newInterval[0] {
                result.append(interval)
            } else {
                newInterval = [
                    min(newInterval[0], interval[0]),
                    max(newInterval[1], interval[1])
                ]
            }
        }
        result.append(newInterval)
        return result
    }
    
    func insertBinary(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        let n = intervals.count
        guard n > 0 else { return [newInterval] }
        var result = intervals
        var l = 0
        var r = n - 1
        var newL = newInterval[0]
        var newR = newInterval[1]
        var sIndex = -1
        while l <= r {
            let mid = r - (r - l) / 2
            if max(result[mid][0], newL) <= min(result[mid][1], newR) {
                sIndex = mid
                r = mid - 1
            } else if newR < result[mid][0] {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        guard sIndex != -1 else {
            result.insert(newInterval, at: l)
            return result
        }
        r = n - 1
        var fIndex = sIndex
        newL = min(newL, result[l][0])
        while l <= r {
            let mid = r - (r - l) / 2
            if max(result[mid][0], newL) <= min(result[mid][1], newR) {
                fIndex = mid
                l = mid + 1
            } else if newR < result[mid][0] {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        newR = max(newR, result[r][1])
        result.replaceSubrange(sIndex...fIndex, with: [[newL, newR]])
        return result
    }
    
    func insert1(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
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
