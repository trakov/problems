final class ConcatenateNonZeroDigitsandMultiplybySumII {
    func sumAndMultiply(_ s: String, _ queries: [[Int]]) -> [Int] {
        let MOD = 1000000007
        let MAX_N = 100001
        var pow10 = Array(repeating: 0, count: MAX_N)
        pow10[0] = 1
        for i in 1..<MAX_N {
            pow10[i] = (pow10[i - 1] * 10) % MOD
        }
        let n = s.count
        var sum = Array(repeating: 0, count: n + 1)
        var x = Array(repeating: 0, count: n + 1)
        var cnt = Array(repeating: 0, count: n + 1)
        for (i, c) in s.enumerated() {
            let d = Int(c.asciiValue! - Character("0").asciiValue!)
            sum[i + 1] = sum[i] + d
            x[i + 1] = d > 0 ? (x[i] * 10 + d) % MOD : x[i]
            cnt[i + 1] = cnt[i] + (d > 0 ? 1 : 0)
        }
        var res = Array(repeating: 0, count: queries.count)
        for (i, q) in queries.enumerated() {
            let (l, r) = (q[0], q[1] + 1)
            let length = cnt[r] - cnt[l]
            let val_x = (x[r] - ((x[l] * pow10[length]) % MOD) + MOD) % MOD
            let val_sum = sum[r] - sum[l]
            res[i] = ((val_x * val_sum) % MOD)
        }
        return res
    }
    
    func tests() {
        print(sumAndMultiply("10203004", [[0,7],[1,3],[4,6]])) // [12340, 4, 9]
        print(sumAndMultiply("1000", [[0,3],[1,1]])) // [1, 0]
        print(sumAndMultiply("9876543210", [[0,9]])) // [444444137]
    }
}
