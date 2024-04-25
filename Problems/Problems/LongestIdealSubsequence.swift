class LongestIdealSubsequence {
    func longestIdealString(_ s: String, _ k: Int) -> Int {
        let n = s.count
        guard k < 25 else { return n }
        let nums = s.map { Int($0.asciiValue!) - Int(Character("a").asciiValue!) }
        var dp = Array(repeating: 1, count: n)
        var lastIndices = Array(repeating: -1, count: 26)
        var result = 1
        for (i, num) in nums.enumerated() {
            var value = 0
            for j in max(0, num - k)...min(25, num + k) where lastIndices[j] > -1 {
                value = max(dp[lastIndices[j]], value)
            }
            lastIndices[num] = i
            dp[i] = value + 1
            result = max(result, dp[i])
        }
        return result
    }
    
    func tests() {
        print(longestIdealString("lkpkxcigcs", 6)) // 7
        print(longestIdealString("acfgbd", 2)) // 4
        print(longestIdealString("abcd", 3)) // 4
    }
}

