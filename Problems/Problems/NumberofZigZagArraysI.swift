final class NumberofZigZagArraysI {
    func zigZagArrays(_ n: Int, _ l: Int, _ r: Int) -> Int {
        let MOD = 1_000_000_007
        var dp0 = Array(repeating: 0, count: r + 1)
        var dp1 = Array(repeating: 0, count: r + 1)
        var sum0 = Array(repeating: 0, count: r + 2)
        var sum1 = Array(repeating: 0, count: r + 2)
        for i in l...r {
            dp0[i] = 1
            dp1[i] = 1
            sum0[i] = i - l + 1
            sum1[i] = i - l + 1
        }
        for _ in 1..<n {
            for j in l...r {
                dp0[j] = (sum1[r] - sum1[j] + MOD) % MOD
                dp1[j] = sum0[j - 1]
            }
            sum0[l] = dp0[l]
            sum1[l] = dp1[l]
            for j in l+1...r {
                sum0[j] = (sum0[j - 1] + dp0[j]) % MOD
                sum1[j] = (sum1[j - 1] + dp1[j]) % MOD
            }
        }
        return (sum0[r] + sum1[r]) % MOD
    }
    
    func tests() {
        print(zigZagArrays(3, 4, 5)) // 2
        print(zigZagArrays(3, 1, 3)) // 10
    }
}
