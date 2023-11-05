class MaximumProfitInJobScheduling {
    func jobScheduling(_ startTime: [Int], _ endTime: [Int], _ profit: [Int]) -> Int {
        let n = startTime.count
        guard n > 1 else { return profit.first ?? 0 }
        let jobs = startTime.indices.map { i in
            (startTime[i], endTime[i], profit[i])
        }.sorted { j1, j2 in
            if j1.1 == j2.1 {
                return j1.0 <= j2.0
            } else {
                return j1.1 < j2.1
            }
        }
        var dp = Array(repeating: jobs.first!.2, count: n)
        for i in 1..<dp.count {
            var l = 0
            var r = i - 1
            var maxPrevJobId = -1
            while l <= r {
                let mid = (l + r) / 2
                if jobs[mid].1 <= jobs[i].0 {
                    maxPrevJobId = mid
                    l = mid + 1
                } else {
                    r = mid - 1
                }
            }
            if maxPrevJobId == -1 {
                dp[i] = max(dp[i - 1], jobs[i].2)
            } else {
                dp[i] = max(dp[i - 1], jobs[i].2 + dp[maxPrevJobId])
            }
        }
        return dp[n - 1]
    }
    
    func tests() {
        print(jobScheduling([1,2,3,3], [3,4,5,6], [50,10,40,70])) // 120
        print(jobScheduling([1,2,3,4,6], [3,5,10,6,9], [20,20,100,70,60])) // 150
        print(jobScheduling([1,1,1], [2,3,4], [5,6,4])) // 6
    }
}

