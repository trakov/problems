final class NumberofZigZagArraysII {
    class Matrix {
        let MOD = 1_000_000_007
        let n: Int
        let m: Int
        var data: [Int]
        init(_ n: Int, _ m: Int) {
            self.n = n
            self.m = m
            data = Array(repeating: 0, count: n * m)
        }
        func get(_ i: Int, _ j: Int) -> Int { data[i * m + j] }
        func set(_ i: Int, _ j: Int, _ val: Int) { data[i * m + j] = val }
        func mul(_ b: Matrix) -> Matrix {
            let res = Matrix(n, b.m)
            for i in 0..<n {
                for k in 0..<m {
                    let r = get(i, k)
                    if r == 0 {
                        continue
                    }
                    for j in 0..<b.m {
                        res.set(i, j, (res.get(i, j) + r * b.get(k, j)) % MOD)
                    }
                }
            }
            return res
        }
        func pow(_ exp: Int, _ res: Matrix) -> Matrix {
            var base = Matrix(n, m)
            for (i, d) in data.enumerated() {
                base.data[i] = d
            }
            var exp = exp
            var res = res
            while exp > 0 {
                if (exp & 1) == 1 {
                    res = res.mul(base)
                }
                base = base.mul(base)
                exp >>= 1
            }
            return res
        }
    }

    func zigZagArrays(_ n: Int, _ l: Int, _ r: Int) -> Int {
        let MOD = 1_000_000_007
        let m = r - l + 1
        if n == 1 { return m }
        let u = Matrix(2 * m, 2 * m)
        for i in 0..<m {
            for j in 0..<i {
                u.set(i, j + m, 1)
            }
            for j in i+1..<m {
                u.set(i + m, j, 1)
            }
        }
        var dp = Matrix(1, 2 * m)
        for i in 0..<2*m {
            dp.set(0, i, 1)
        }
        dp = u.pow(n - 1, dp)
        var result = 0
        for i in 0..<2*m {
            result = (result + dp.get(0, i)) % MOD
        }
        return result
    }
    
    func tests() {
        print(zigZagArrays(3, 4, 5)) // 2
        print(zigZagArrays(3, 1, 3)) // 10
    }
}
