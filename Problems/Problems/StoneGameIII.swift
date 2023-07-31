class StoneGameIII {
    func stoneGameIII(_ stoneValue: [Int]) -> String {
        let n = stoneValue.count
        var dp = Array(repeating: 0, count: n + 1)
        for i in (0..<n).reversed() {
            dp[i] = stoneValue[i] - dp[i + 1]

            if i + 2 <= n {
                dp[i] = max(dp[i], stoneValue[i] + stoneValue[i + 1] - dp[i + 2])
            }

            if i + 3 <= n {
                dp[i] = max(dp[i], stoneValue[i] + stoneValue[i + 1] + stoneValue[i + 2] - dp[i + 3])
            }
        }
        
        return dp[0] == 0 ? "Tie" : dp[0] > 0 ? "Alice" : "Bob"
    }
    
    func tests() {
        print(stoneGameIII([1,2,3,7])) // Bob
        print(stoneGameIII([1,2,3,-9])) // Alice
        print(stoneGameIII([1,2,3,6])) // Tie
    }
}

