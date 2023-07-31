class IntegerBreak {
    func integerBreak(_ n: Int) -> Int {
        var dp = [0,1,1,2,4,6,9]
        
        while dp.count <= n {
            dp.append(dp[dp.count - 3] * 3)
        }
        
        return dp[n]
    }

    func tests() {
        print(integerBreak(2)) // 1
        print(integerBreak(10)) // 36
    }
}
