final class FindSumofArrayProductofMagicalSequences {
    func magicalSum(_ m: Int, _ k: Int, _ nums: [Int]) -> Int {
        let MOD = 1_000_000_007
        let n = nums.count
        var C = Array(repeating: Array(repeating: 0, count: m + 1), count: m + 1)
        for i in 0...m {
            C[i][0] = 1
            C[i][i] = 1
            guard i > 0 else { continue }
            for j in 1..<i {
                C[i][j] = (C[i-1][j-1] + C[i-1][j]) % MOD
            }
        }
        var pow = Array(repeating: Array(repeating: 0, count: m + 1), count: n)
        for i in 0..<n {
            pow[i][0] = 1
            for cnt in 1...m {
                pow[i][cnt] = pow[i][cnt-1] * nums[i] % MOD
            }
        }
        var dp = Array(
            repeating: Array(
                repeating: Array(
                    repeating: Array(
                        repeating: 0, count: m + 1
                    ), count: m + 1
                ), count: k + 1
            ), count: n + 1
        )
        dp[0][0][0][0] = 1
        for pos in 0..<n {
            for bits in 0...k {
                for carry in 0...m {
                    for chosen in 0...m {
                        if dp[pos][bits][carry][chosen] == 0 { continue }
                        let remaining = m - chosen
                            for cnt in 0...remaining {
                            let total = carry + cnt
                            let new_bits = bits + (total & 1)
                            let new_carry = total >> 1
                            if (new_bits <= k && new_carry <= m) {
                                let add = dp[pos][bits][carry][chosen]
                                    * C[remaining][cnt] % MOD
                                    * pow[pos][cnt] % MOD
                                dp[pos+1][new_bits][new_carry][chosen+cnt] =
                                    (dp[pos+1][new_bits][new_carry][chosen+cnt] + add) % MOD;
                            }
                        }
                    }
                }
            }
        }
        var res = 0
        for carry in 0...m {
            let carry_bits = carry.nonzeroBitCount
            if carry_bits <= k {
                res = (res + dp[n][k - carry_bits][carry][m]) % MOD
            }
        }
        return res
    }
    
    func tests() {
        print(magicalSum(5, 5, [1,10,100,10000,1000000])) // 991600007
        print(magicalSum(2, 2, [5,4,3,2,1])) // 170
        print(magicalSum(1, 1, [28])) // 28
    }
}
