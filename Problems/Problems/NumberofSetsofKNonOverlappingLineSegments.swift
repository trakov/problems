final class NumberofSetsofKNonOverlappingLineSegments {
    func numberOfSets(_ n: Int, _ k: Int) -> Int {
        let mod = 1_000_000_007
        func quickPow(_ a: Int, _ e: Int) -> Int {
            var result = 1
            var (a, e) = (a, e)
            while e > 0 {
                if (e & 1) != 0 { result = (result * a) % mod }
                a = (a * a) % mod
                e >>= 1
            }
            return result
        }
        let m = 2 * k
        var (numerator, denominator) = (1, 1)
        for i in 1...m {
            numerator = (numerator * (n + k - i)) % mod
            denominator = (denominator * i) % mod
        }
        return (numerator * quickPow(denominator, mod - 2)) % mod
    }

    func tests() {
        print(numberOfSets(4, 2)) // 5
        print(numberOfSets(3, 1)) // 3
        print(numberOfSets(30, 7)) // 796297179
    }
}
