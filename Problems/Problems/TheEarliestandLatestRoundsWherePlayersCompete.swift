final class TheEarliestandLatestRoundsWherePlayersCompete {
    var F = Array(repeating: Array(repeating: Array(repeating: 0, count: 30), count: 30), count: 30)
    var G = Array(repeating: Array(repeating: Array(repeating: 0, count: 30), count: 30), count: 30)
    func earliestAndLatest(_ n: Int, _ firstPlayer: Int, _ secondPlayer: Int) -> [Int] {
        func dp(_ n: Int, _ f: Int, _ s: Int) -> [Int] {
            if F[n][f][s] != 0 { return [F[n][f][s], G[n][f][s]] }
            if f + s == n + 1 { return [1, 1] }
            if f + s > n + 1 {
                let res = dp(n, n + 1 - s, n + 1 - f)
                F[n][f][s] = res[0]
                G[n][f][s] = res[1]
                return [F[n][f][s], G[n][f][s]]
            }
            var (earliest, latest) = (Int.max, Int.min)
            let n_half = (n + 1) / 2
            if s <= n_half {
                for i in 0..<f {
                    for j in 0..<s-f {
                        let res = dp(n_half, i + 1, i + j + 2)
                        earliest = min(earliest, res[0])
                        latest = max(latest, res[1])
                    }
                }
            } else {
                let s_prime = n + 1 - s
                let mid = (n - 2 * s_prime + 1) / 2
                for i in 0..<f {
                    for j in 0..<s_prime-f {
                        let res = dp(n_half, i + 1, i + j + mid + 2)
                        earliest = min(earliest, res[0])
                        latest = max(latest, res[1])
                    }
                }
            }
            F[n][f][s] = earliest + 1
            G[n][f][s] = latest + 1
            return [F[n][f][s], G[n][f][s]]
        }
        let (f, s) = (min(firstPlayer, secondPlayer), max(firstPlayer, secondPlayer))
        let result = dp(n, f, s)
        return [result[0], result[1]]
    }
    
    func tests() {
        print(earliestAndLatest(11, 2, 4)) // [3,4]
        print(earliestAndLatest(5, 1, 5)) // [1,1]
    }
}
