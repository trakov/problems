class DecodeWays {
    func numDecodings(_ s: String) -> Int {
        let s = [0] + s.map { Int(String($0))! }
        let n = s.count
        var dp = Array(repeating: 0, count: n + 1)
        dp[1] = 1
        for i in 1..<n {
            let cur = s[i]
            let prev = s[i - 1]
            if cur != 0 {
                dp[i + 1] = dp[i]
            }
            if prev == 1 || (prev == 2 && cur < 7) {
                dp[i + 1] += dp[i - 1]
            }
        }
        return dp[n]
    }

    func numDecodings2(_ s: String) -> Int {
        guard s.count > 1 else { return s == "0" ? 0 : 1 }
        let s = Array(s)
        var dp = Array(repeating: 0, count: s.count + 1)
        dp[0] = 1
        for (i, c) in s.enumerated() {
            if c != "0" {
                dp[i+1] = dp[i]
            }
            if i > 0 && "\(s[i-1])\(c)" <= "26" && "\(s[i-1])\(c)" >= "10" {
                dp[i+1] += dp[i-1]
            }
        }
        
        return dp.last!
    }

    func tests() {
        print(numDecodings("1123")) // 5
        print(numDecodings("106")) // 1
        print(numDecodings("110")) // 1
        print(numDecodings("10")) // 1
        print(numDecodings("777")) // 1
        print(numDecodings("717")) // 2
        print(numDecodings("71728")) // 2
        print(numDecodings("12")) // 2
        print(numDecodings("226")) // 3
        print(numDecodings("06")) // 0
        print(numDecodings("11106")) // 2
    }
}
