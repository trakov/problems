final class MaximumProfitfromTradingStockswithDiscounts {
    func maxProfit(_ n: Int, _ present: [Int], _ future: [Int], _ hierarchy: [[Int]], _ budget: Int) -> Int {
        let underlings = hierarchy.reduce(into: Array(repeating: [Int](), count: n+1)) { a,e in
            a[e[0]].append(e[1])
        }
        var dp = Array(repeating: Array(repeating: [-1,-1], count: budget+1), count: n+1)
        func dfs(_ id: Int) {
            var buy = Array(repeating: 0, count: budget+1)
            var skip = Array(repeating: 0, count: budget+1)
            for employee in underlings[id] {
                dfs(employee)
                (buy,skip) = dp[id].indices.reduce(into:(skip,skip)) {t,i in
                    for j in (0...i).reversed() {
                        t.0[i] = max(t.0[i], buy[i-j] + dp[employee][j][1])
                        t.1[i] = max(t.1[i], skip[i-j] + dp[employee][j][0])
                    }
                }
            }
            let p = present[id-1], f = future[id-1], h = p/2
            for i in dp[id].indices {
                dp[id][i][0] = max(skip[i], i >= p ? max(0, f-p + buy[i-p]) : 0)
                dp[id][i][1] = max(skip[i], i >= h ? max(0, f-h + buy[i-h]) : 0)
            }
        }
        dfs(1)
        return dp[1][budget][0]
    }
    
    func tests() {
        print(maxProfit(2, [1,2], [4,3], [[1,2]], 3)) // 5
        print(maxProfit(2, [3,4], [5,8], [[1,2]], 4)) // 4
        print(maxProfit(3, [4,6,8], [7,9,11], [[1,2],[1,3]], 10)) // 10
        print(maxProfit(3, [5,2,3], [8,5,6], [[1,2],[2,3]], 7)) // 12
    }
}
