class MostProfitAssigningWork {
    func maxProfitAssignment(
        _ difficulty: [Int], _ profit: [Int], _ worker: [Int]
    ) -> Int {
        let w = worker.max()!
        var dp = Array(repeating: 0, count: w + 1)
        for (diff, prof) in zip(difficulty, profit) where diff <= w {
            dp[diff] = max(dp[diff], prof)
        }
        for i in 1...w {
            dp[i] = max(dp[i], dp[i - 1])
        }
        return worker.reduce(0) { $0 + dp[$1] }
    }
    
    func tests() {
        print(maxProfitAssignment([2,4,6,8,10], [10,20,30,40,50], [4,5,6,7]))
        // 100
        print(maxProfitAssignment([85,47,57], [24,66,99], [40,25,25])) // 0
    }
}

