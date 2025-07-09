final class RescheduleMeetingsforMaximumFreeTimeI {
    func maxFreeTime(
        _ eventTime: Int, _ k: Int, _ startTime: [Int], _ endTime: [Int]
    ) -> Int {
        let n = startTime.count
        var result = 0
        var t = 0
        for i in 0..<n {
            t += endTime[i] - startTime[i]
            let left = i <= k - 1 ? 0 : endTime[i - k]
            let right = i == n - 1 ? eventTime : startTime[i + 1]
            result = max(result, right - left - t)
            if i >= k - 1 {
                t -= endTime[i - k + 1] - startTime[i - k + 1]
            }
        }
        return result
    }
    
    func tests() {
        print(maxFreeTime(5, 1, [1,3], [2,5])) // 2
        print(maxFreeTime(10, 1, [0,2,9], [1,4,10])) // 6
        print(maxFreeTime(5, 2, [0,1,2,3,4], [1,2,3,4,5])) // 0
    }
}
