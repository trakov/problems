class New21Game {
    func new21Game(_ n: Int, _ k: Int, _ maxPts: Int) -> Double {
        guard k != 0 && n < (k + maxPts) else { return 1.0 }
        var dp = Array(repeating: 0.0, count: n + 1)
        dp[0] = 1
        var s: Double = k > 0 ? 1 : 0
        for i in 1...n {
            dp[i] = s / Double(maxPts)
            if i < k {
                s += dp[i]
            }
            if i - maxPts >= 0 && i - maxPts < k {
                s -= dp[i - maxPts]
            }
        }
        var result = 0.0
        for i in k...n {
            result += dp[i]
        }
        return result
    }
    
    func tests() {
        print(new21Game(10, 1, 10)) // 1.0
        print(new21Game(6, 1, 10)) // 0.6
        print(new21Game(21, 17, 10)) // 0.73278
    }
}

