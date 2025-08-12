import Foundation
final class WaystoExpressanIntegerasSumofPowers {
    func numberOfWays(_ n: Int, _ x: Int) -> Int {
        let mod = 1_000_000_007
        var dp = Array(repeating: 0, count: n + 1)
        dp[0] = 1
        for i in 1...n {
            let val = Int(pow(Double(i), Double(x)))
            if val > n {
                break
            }
            for j in (val...n).reversed() {
                dp[j] = (dp[j] + dp[j - val]) % mod
            }
        }
        return dp[n]
    }
    
    func tests() {
        print(numberOfWays(10, 2)) // 1
        print(numberOfWays(4, 1)) // 2
    }
}
