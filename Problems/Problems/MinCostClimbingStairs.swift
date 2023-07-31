class MinCostClimbingStairs {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var a = cost[0]
        var b = cost[1]
        for i in 2 ..< cost.count + 1 {
            let c = i < cost.count ? cost[i] : 0
            (a, b) = (b, min(a + c, b + c))
        }
        return b
    }
    
    func minCostClimbingStairsDP(_ cost: [Int]) -> Int {
        var dp = Array(repeating: 0, count: cost.count + 1)
        dp[0] = cost[0]
        dp[1] = cost[1]
        for i in 2 ..< cost.count + 1 {
            let c = i < cost.count ? cost[i] : 0
            dp[i] = min(dp[i - 1] + c, dp[i - 2] + c)
        }
        return dp[cost.count]
    }

    func tests() {
        print(minCostClimbingStairs([20,15])) // 15
        print(minCostClimbingStairs([10,15,20])) // 15
        print(minCostClimbingStairs([1,100,1,1,1,100,1,1,100,1])) // 6
    }
}
