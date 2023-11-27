class KnightDialer {
    func knightDialer(_ n: Int) -> Int {
        guard n > 1 else { return 10 }
        let map = [
            0: [4, 6], 1: [6, 8], 2: [7, 9], 3: [4, 8],
            4: [3, 9, 0], 6: [1, 7, 0],
            7: [2, 6], 8: [1, 3], 9: [2, 4]
        ]
        let mod = 1_000_000_007
        var dp = Array(repeating: 1, count: 10)
        for _ in 0..<n-1 {
            var prevDP = dp
            for j in 0..<10 where j != 5 {
                prevDP[j] = map[j]!.reduce(0, { $0 + dp[$1] }) % mod
            }
            dp = prevDP
        }
        return dp.reduce(-1, +) % mod
    }
    
    func tests() {
        print(knightDialer(1)) // 10
        print(knightDialer(2)) // 20
        print(knightDialer(3)) // 46
        print(knightDialer(4)) // 104
        print(knightDialer(3131)) // 136006598
    }
}

