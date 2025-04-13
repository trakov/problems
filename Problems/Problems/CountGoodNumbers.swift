final class CountGoodNumbers {
    private let mod = 1_000_000_007
    func countGoodNumbers(_ n: Int) -> Int {
        func quickmul(_ x: Int, _ y: Int) -> Int {
            var ret = 1
            var mul = x
            var y = y
            while y > 0 {
                if y % 2 == 1 {
                    ret = (ret * mul) % mod
                }
                mul = (mul * mul) % mod
                y /= 2
            }
            return ret
        }
        return (quickmul(5, (n + 1) / 2) * quickmul(4, n / 2)) % mod
    }
    
    func tests() {
        print(countGoodNumbers(1)) // 5
        print(countGoodNumbers(4)) // 400
        print(countGoodNumbers(50)) // 564908303
    }
}
