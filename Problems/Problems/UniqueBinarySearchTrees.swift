class UniqueBinarySearchTrees {
    func numTrees(_ n: Int) -> Int {
        guard n > 2 else { return n }
        var dp = Array(repeating: 0, count: n + 1)
        dp[0] = 1
        dp[1] = 1
        for i in 2...n {
            for j in 0..<i {
                dp[i] += dp[j] * dp[i - j - 1]
            }
        }
        return dp[n]
    }
    
    func tests() {
        print(numTrees(1)) // 1
        print(numTrees(2)) // 2
        print(numTrees(3)) // 5
        print(numTrees(4)) // 14
        print(numTrees(5)) // 42
    }
}

