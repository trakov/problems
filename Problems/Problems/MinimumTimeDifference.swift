class MinimumTimeDifference {
    // backet sort
    func findMinDifference(_ timePoints: [String]) -> Int {
        var times = Array(repeating: 0, count: 60 * 24)
        for time in timePoints {
            let comps = time.split(separator: ":")
            let h = Int(comps[0])!
            let m = Int(comps[1])!
            times[60 * h + m] += 1
            if times[60 * h + m] > 1 { return 0 }
        }
        var result = Int.max
        var first = -1
        var prev = -1
        for (minutes, count) in times.enumerated() where count > 0 {
            if prev != -1 {
                result = min(result, minutes - prev)
            }
            prev = minutes
            if first == -1 {
                first = minutes
            }
        }
        return min(result, first + 60 * 24 - prev)
    }
    
    // sort
    func findMinDifference2(_ timePoints: [String]) -> Int {
        var times = timePoints.map { time in
            let comps = time.split(separator: ":")
            let h = Int(comps[0])!
            let m = Int(comps[1])!
            return 60 * h + m
        }
        times.sort()
        let n = times.count
        var result = Int.max
        for (i, time) in times.enumerated() {
            let nextTime = (i + 1 < n) ? times[i + 1] : (times[0] + 60 * 24)
            result = min(result, nextTime - time)
            if result == 0 {
                break
            }
        }
        return result
    }
    
    func tests() {
        print(findMinDifference(["23:59","00:00"])) // 1
        print(findMinDifference(["00:00","23:59","00:00"])) // 0
    }
}

