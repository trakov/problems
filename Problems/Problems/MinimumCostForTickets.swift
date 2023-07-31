class MinimumCostForTickets {
    func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
        var dp: [Int: Int] = [:]
        
        func dfs(_ i: Int) -> Int {
            if i == days.count { return 0 }
            if dp[i] != nil { return dp[i]! }
            dp[i] = Int.max
            for (d, c) in zip([1, 7, 30], costs) {
                var j = i
                while j < days.count, days[j] < days[i] + d {
                    j += 1
                }
                dp[i] = min(dp[i]!, c + dfs(j))
            }
            return dp[i]!
        }
        
        return dfs(0)
    }

    func mincostTickets2(_ days: [Int], _ costs: [Int]) -> Int {
        var dp = Array(repeating: 0, count: 396) // 365 + 31
        let daysSet = Set(days)
        
        for i in 31...395 {
            if !daysSet.contains(i - 30) {
                dp[i] = dp[i - 1]
            } else {
                dp[i] = min(
                    dp[i - 1] + costs[0],
                    dp[i - 7] + costs[1],
                    dp[i - 30] + costs[2]
                )
            }
        }
        return dp.last!
    }
    
    func tests() {
        print(mincostTickets([1,4,6,7,8,20], [2,7,15])) // 11
        print(mincostTickets([1,2,3,4,5,6,7,8,9,10,30,31], [2,7,15])) // 17
    }
}

