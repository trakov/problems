final class NumberofWaystoPaintN3Grid {
    func numOfWays(_ n: Int) -> Int {
        let mod = 1_000_000_007
        var a = 6 // 121 like count
        var b = 6 // 123 like count
        for _ in 0..<n-1 {
            (a, b) = ((b * 2 + a * 2) % mod, (b * 3 + a * 2) % mod)
        }
        return (a + b) % mod
    }
    
    func tests() {
        print(numOfWays(1)) // 12
        print(numOfWays(2)) // 6 * 4 + 6 * 5 = 24 + 30 = 54
        print(numOfWays(3)) // 243
        print(numOfWays(5000)) // 30228214
    }
}
