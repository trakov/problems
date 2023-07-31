class ProfitableSchemes {
    func profitableSchemes(_ n: Int, _ minProfit: Int, _ group: [Int], _ profit: [Int]) -> Int {
        let mod = 1000000007
        var dp = Array(repeating: Array(repeating: 0, count: minProfit+1), count: n+1)
        dp[0][0] = 1
        for (i, g) in group.enumerated() {
            let p = profit[i]
            for j in stride(from: n, through: g, by: -1) {
                for k in stride(from: minProfit, through: 0, by: -1) {
                    dp[j][k] = (dp[j][k] + dp[j-g][max(0, k-p)]) % mod
                }
            }
        }
        var result = 0
        for i in 0...n {
            result = (result + dp[i][minProfit]) % mod
        }
        return result
    }

    func profitableSchemes2(_ n: Int, _ minProfit: Int, _ group: [Int], _ profit: [Int]) -> Int {
        let mod = 1000000007
        let m = group.count
        var memo = Array(
            repeating: Array(
                repeating: Array(
                    repeating: -1,
                    count: minProfit + 1
                ),
                count: n + 1),
            count: m + 1)
        
        func find(_ pos: Int, _ count: Int, _ curProfit: Int) -> Int {
            if (pos == m) {
                return curProfit >= minProfit ? 1 : 0
            }
            if (memo[pos][count][curProfit] != -1) {
                return memo[pos][count][curProfit];
            }
            var totalWays = find(pos + 1, count, curProfit)
            if (count + group[pos] <= n) {
                totalWays += find(
                    pos + 1,
                    count + group[pos],
                    min(minProfit, curProfit + profit[pos])
                )
            }
            
            memo[pos][count][curProfit] = totalWays % mod
            return memo[pos][count][curProfit]
        }
        
        return find(0, 0, 0)
    }
    
    func tests() {
        print(profitableSchemes(1, 1, [2,2,2,2,2], [1,2,1,1,0])) //
        print(profitableSchemes(5, 3, [2,2], [2,3])) // 2
        print(profitableSchemes(10, 5, [2,3,5], [6,7,8])) // 7
    }
}

