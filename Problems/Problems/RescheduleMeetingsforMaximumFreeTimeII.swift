final class RescheduleMeetingsforMaximumFreeTimeII {
    func maxFreeTime(_ eventTime: Int, _ startTime: [Int], _ endTime: [Int]) -> Int {
        let n = startTime.count
        var q = Array(repeating: false, count: n)
        var (t1, t2) = (0, 0)
        for i in 0..<n {
            if endTime[i] - startTime[i] <= t1 {
                q[i] = true
            }
            t1 = max(t1, startTime[i] - (i == 0 ? 0 : endTime[i - 1]))
            
            if endTime[n - i - 1] - startTime[n - i - 1] <= t2 {
                q[n - i - 1] = true
            }
            t2 = max(t2, (i == 0 ? eventTime : startTime[n - i]) - endTime[n - i - 1])
        }
        var result = 0
        for i in 0..<n {
            let left = i == 0 ? 0 : endTime[i - 1]
            let right = i == n - 1 ? eventTime : startTime[i + 1]
            if q[i] {
                result = max(result, right - left)
            } else {
                result = max(result, right - left - (endTime[i] - startTime[i]))
            }
        }
        return result
    }
    
    func tests() {
        print(maxFreeTime(5, [1,3], [2,5])) // 2
        print(maxFreeTime(10, [0,7,9], [1,8,10])) // 7
        print(maxFreeTime(10, [0,3,7,9], [1,4,8,10])) // 6
        print(maxFreeTime(5, [0,1,2,3,4], [1,2,3,4,5])) // 0
    }
}
