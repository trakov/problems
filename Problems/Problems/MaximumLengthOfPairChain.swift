class MaximumLengthOfPairChain {
    func findLongestChain(_ pairs: [[Int]]) -> Int {
        guard !pairs.isEmpty else { return 0 }
        let n = pairs.count
        guard n > 1 else { return 1 }
        let pairs = pairs.sorted { $0[0] < $1[0] }
        var dp = Array(repeating: 1, count: n)
        var result = 1
        for i in 1..<n {
            for j in 0..<i {
                let prev = pairs[j]
                let current = pairs[i]
                if current[0] > prev[1] {
                    dp[i] = max(dp[i], dp[j] + 1)
                    result = max(result, dp[i])
                }
            }
        }
        return result
    }
    
    func tests() {
        print(findLongestChain([[1,2],[2,3],[3,4]])) // 2
        print(findLongestChain([[1,2],[7,8],[4,5]])) // 3
    }
}

