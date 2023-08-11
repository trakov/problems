class CoinChangeII {
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        nonRecursiveOptimized(amount, coins)
    }
    
    // Top-Down DP / recursive
    
    func recursive(_ amount: Int, _ coins: [Int]) -> Int {
        var memo = Array(
            repeating: Array(repeating: -1, count: amount + 1), count: coins.count
        )
        func numberOfWays(_ i: Int, _ amount: Int) -> Int {
            if amount == 0 { return 1 }
            if i == coins.count { return 0 }
            if memo[i][amount] != -1 { return memo[i][amount] }
            
            if coins[i] > amount {
                memo[i][amount] = numberOfWays(i + 1, amount)
            } else {
                memo[i][amount] = numberOfWays(i, amount - coins[i]) + numberOfWays(i + 1, amount)
            }
            return memo[i][amount]
        }
        return numberOfWays(0, amount)
    }
    
    // Bottom-Up DP
    
    func nonRecursive(_ amount: Int, _ coins: [Int]) -> Int {
        let n = coins.count
        var dp = Array(
            repeating: Array(repeating: 0, count: amount + 1), count: n + 1
        )
        for i in 0..<n {
            dp[i][0] = 1
        }
        for i in (0...n-1).reversed() {
            for j in 1..<amount + 1 {
                if coins[i] > j {
                    dp[i][j] = dp[i + 1][j]
                } else {
                    dp[i][j] = dp[i + 1][j] + dp[i][j - coins[i]]
                }
            }
        }
        return dp[0][amount]
    }
    
    // Bottom-Up DP space optimized
    
    func nonRecursiveOptimized(_ amount: Int, _ coins: [Int]) -> Int {
        let n = coins.count
        var dp = Array(repeating: 0, count: amount + 1)
        dp[0] = 1
        for coin in coins.reversed() {
            guard coin <= amount else { continue }
            for j in coin..<amount + 1 {
                dp[j] += dp[j - coin]
            }
        }
        return dp[amount]
    }
    
    func tests() {
        print(change(0, [7])) // 0
        print(change(5, [1,2,5])) // 4
        print(change(3, [2])) // 0
        print(change(10, [10])) // 1
    }
}

