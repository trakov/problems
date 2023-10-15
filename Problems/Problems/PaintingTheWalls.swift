class PaintingTheWalls {
    func paintWalls(_ cost: [Int], _ time: [Int]) -> Int {
        let n = cost.count
        let empty = Array(repeating: 0, count: n + 1)
        var dp = empty
        var prevDp = Array(repeating: 1_000_000_000, count: n + 1)
        prevDp[0] = 0
        for i in (0..<n).reversed() {
            dp = empty
            for remain in 1...n {
                dp[remain] = min(
                    cost[i] + prevDp[max(0, remain - 1 - time[i])],
                    prevDp[remain]
                )
            }
            prevDp = dp
        }
        return dp[n]
    }
    
    func tests() {
        print(paintWalls([1,2,3,2], [1,2,3,2])) // 3
        print(paintWalls([2,3,4,2], [1,1,1,1])) // 4
    }
}
