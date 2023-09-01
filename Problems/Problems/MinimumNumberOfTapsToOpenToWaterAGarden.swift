class MinimumNumberOfTapsToOpenToWaterAGarden {
    func minTaps(_ n: Int, _ ranges: [Int]) -> Int {
        let maxValue = n + 1
        var dp = Array(repeating: maxValue, count: n + 1)
        dp[0] = 0
        for i in 0...n {
            let tapStart = max(0, i - ranges[i])
            let tapEnd = min(n, i + ranges[i])
            for j in tapStart...tapEnd {
                dp[tapEnd] = min(dp[tapEnd], dp[j] + 1)
            }
        }
        return dp[n] == maxValue ? -1 : dp[n]
    }
    
    func tests() {
        print(minTaps(5, [3,4,1,1,0,0])) // 1
        print(minTaps(3, [0,0,0,0])) // -1
    }
}

