class BestTeamWithNoConflicts {
    func bestTeamScore(_ scores: [Int], _ ages: [Int]) -> Int {
        let players = zip(scores, ages).sorted(by: { first, second in
            if first.1 == second.1 {
                return first.0 < second.0
            } else {
                return first.1 < second.1
            }
        })
        let n = players.count
        var result = 0
        var dp = Array(repeating: 0, count: n)
        for i in 0..<n {
            dp[i] = players[i].0
            result = max(result, players[i].0)
        }
        for i in 1..<n {
            for j in 0..<i {
                if players[i].0 >= players[j].0 {
                    dp[i] = max(dp[i], dp[j] + players[i].0)
                }
            }
            result = max(result, dp[i])
        }
        return result
    }

    func tests() {
        print(bestTeamScore([1,3,5,10,15], [1,2,3,4,5])) // 34
        print(bestTeamScore([4,5,6,5], [2,1,2,1])) // 16
        print(bestTeamScore([1,2,3,5], [8,9,10,1])) // 6
    }
}
