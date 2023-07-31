class SolvingQuestionsWithBrainpower {
    func mostPoints(_ questions: [[Int]]) -> Int {
        let n = questions.count
        var dp = Array(repeating: 0, count: n)
        dp[n-1] = questions.last![0]
        for i in (0..<n-1).reversed() {
            let q = questions[i]
            let cur = i + q[1] + 1 < n ? q[0] + dp[i + q[1] + 1] : q[0]
            dp[i] = max(dp[i+1], cur)
        }
        return dp[0]
    }
    
    func tests() {
        print(mostPoints([[21,5],[92,3],[74,2],[39,4],[58,2],[5,5],[49,4],[65,3]])) // 157
        print(mostPoints([[3,2],[4,3],[4,4],[2,5]])) // 5
        print(mostPoints([[1,1],[2,2],[3,3],[4,4],[5,5]])) // 7
    }
}

