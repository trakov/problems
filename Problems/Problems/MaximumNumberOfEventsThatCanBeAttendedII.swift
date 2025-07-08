class MaximumNumberOfEventsThatCanBeAttendedII {
    func maxValue(_ events: [[Int]], _ k: Int) -> Int {
        let n = events.count
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: k + 1)
        let events = events.sorted { $0[0] < $1[0] }
        
        func bisectRight(_ target: Int) -> Int {
            var (left, right) = (0, events.count)
            while left < right {
                let mid = (left + right) / 2
                if events[mid][0] <= target {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            return left
        }

        for i in (0..<n).reversed() {
            for count in 1...k {
                let nextIndex = bisectRight(events[i][1])
                dp[count][i] = max(
                    dp[count][i + 1],
                    events[i][2] + dp[count - 1][nextIndex]
                )
            }
        }
        return dp[k][0]
    }
    
    func tests() {
        print(maxValue([[1,2,4],[3,4,3],[2,3,1]], 2)) // 7
        print(maxValue([[1,2,4],[3,4,3],[2,3,10]], 2)) // 10
        print(maxValue([[1,1,1],[2,2,2],[3,3,3],[4,4,4]], 3)) // 9
    }
}
