final class CounttheNumberofArrayswithKMatchingAdjacentElements {
    func countGoodArrays(_ n: Int, _ m: Int, _ k: Int) -> Int {
        let MOD = 1_000_000_007
        let MX = 100000
        var fact = Array(repeating: 0, count: MX)
        var invFact = Array(repeating: 0, count: MX)

        fact[0] = 1
        for i in 1..<MX {
            fact[i] = (fact[i - 1] * i) % MOD
        }
        invFact[MX - 1] = qpow(fact[MX - 1], MOD - 2)
        for i in (1...MX - 1).reversed() {
            invFact[i - 1] = (invFact[i] * i) % MOD
        }

        func comb(_ n: Int, _ m: Int) -> Int {
            (((fact[n] * invFact[m]) % MOD) * invFact[n - m]) % MOD
        }

        func qpow(_ x: Int, _ n: Int) -> Int {
            var res = 1
            var n = n
            var x = x
            while n > 0 {
                if (n & 1) == 1 {
                    res = (res * x) % MOD
                }
                x = (x * x) % MOD
                n >>= 1
            }
            return res
        }

        return (
            ((comb(n - 1, k) * m) % MOD) * qpow(m - 1, n - k - 1)
        ) % MOD
    }
    
    func tests() {
        print(countGoodArrays(3, 2, 1)) // 4
        print(countGoodArrays(4, 2, 2)) // 6
        print(countGoodArrays(5, 2, 0)) // 2
    }
}
