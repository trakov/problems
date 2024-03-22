class CountSquareSumTriples {
    func countTriples(_ n: Int) -> Int {
        guard n > 4 else { return 0 }
        var result = 0
        func gcd(_ x: Int, _ y: Int) -> Int {
            var x = x
            var y = y
            while y != 0 {
                (y, x) = (x % y, y)
            }
            return x
        }
        let x = Int(Double(n).squareRoot())
        for i in 2...x {
            let mSquare = i * i
            for j in 1..<i {
                guard i % 2 + j % 2 == 1 && gcd(i, j) == 1 else {
                    continue
                }
                let c = mSquare + j * j
                if c <= n {
                    result += n / c
                }
            }
        }
        return result * 2
    }
    
    func tests() {
        print(countTriples(5)) // 2
        print(countTriples(10)) // 4
    }
}

