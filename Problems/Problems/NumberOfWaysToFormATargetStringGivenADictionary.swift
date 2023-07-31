class NumberOfWaysToFormATargetStringGivenADictionary {
    func numWays(_ words: [String], _ target: String) -> Int {
        let n = words[0].count
        var charArr = Array(repeating: Array(repeating: 0, count: n), count: 26)
        let aValue = Character("a").asciiValue!
        for word in words {
            for (i, c) in word.enumerated() {
                let index = Int(c.asciiValue! - aValue)
                charArr[index][i] += 1
            }
        }
        let target = Array(target)
        var dp = Array(repeating: Array(repeating: 0, count: target.count), count: n)
        var index = 0
        for j in 0..<target.count {
            var temp = -1
            for i in index..<n {
                let c = Int(target[j].asciiValue! - aValue)
                let val = charArr[c][i]
                if val > 0, temp == -1 {
                    temp = i
                }
                dp[i][j] = (
                    dp[i][j]
                    + (i > 0 ? dp[i-1][j] : 0)
                    + val * (i > 0 && j > 0 ? dp[i-1][j-1] : 1)
                ) % Int(1e9 + 7)
            }
            if temp == -1 { return 0 }
            index = temp + 1
        }
        return dp[n-1][target.count-1]
    }
    
    func tests() {
        print(numWays(["acca","bbbb","caca"], "aba")) // 6
        print(numWays(["abba","baab"], "bab")) // 4
    }
}

