final class StoneGameIV {
    func winnerSquareGame(_ n: Int) -> Bool {
        var dp = Array(repeating: false, count: n + 1)
        for i in 1...n {
            var val = 1
            while val * val <= i {
                if !dp[i - val * val] {
                    dp[i] = true
                    break
                }
                val += 1
            }
        }
        return dp[n]
    }
    
    func tests() {
        print(winnerSquareGame(1)) // true
        print(winnerSquareGame(2)) // false
        print(winnerSquareGame(4)) // true
    }
}
