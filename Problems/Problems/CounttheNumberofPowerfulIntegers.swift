final class CounttheNumberofPowerfulIntegers {
    func numberOfPowerfulInt(_ start: Int, _ finish: Int, _ limit: Int, _ s: String) -> Int {
        func calc(_ x: String) -> Int {
            let prefixLength = x.count - s.count
            if prefixLength < 0 { return 0 }
            var dp = Array(repeating: [0, 0], count: prefixLength + 1)
            dp[prefixLength][0] = 1
            let suffixStart = x.index(x.startIndex, offsetBy: prefixLength)
            let suffixFromVal = String(x[suffixStart...])
            dp[prefixLength][1] = suffixFromVal >= s ? 1 : 0
            for i in stride(from: prefixLength - 1, through: 0, by: -1) {
                let digitChar = x[x.index(x.startIndex, offsetBy: i)]
                let digit = digitChar.wholeNumberValue ?? 0
                dp[i][0] = (limit + 1) * dp[i + 1][0]
                if digit <= limit {
                    dp[i][1] = digit * dp[i + 1][0] + dp[i + 1][1]
                } else {
                    dp[i][1] = (limit + 1) * dp[i + 1][0]
                }
            }
            return dp[0][1]
        }
        return calc(String(finish)) - calc(String(start - 1))
    }

    func tests() {
        print(numberOfPowerfulInt(1, 6000, 4, "124")) // 5
        print(numberOfPowerfulInt(15, 215, 6, "10")) // 2
        print(numberOfPowerfulInt(1000, 2000, 4, "3000")) // 0
    }
}
