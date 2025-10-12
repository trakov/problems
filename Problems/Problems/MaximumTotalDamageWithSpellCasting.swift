final class MaximumTotalDamageWithSpellCasting {
    func maximumTotalDamage(_ power: [Int]) -> Int {
        let n = power.count
        let power = power.sorted()
        var dp = Array(repeating: 0, count: n + 1)
        func helper(_ start: Int = 0) -> Int {
            if start >= n { return 0 }
            if dp[start] > 0 { return dp[start]}
            var end = start
            while end + 1 < n && power[end + 1] == power[start] {
                end += 1
            }
            var next = end + 1
            while next < n && power[next] <= power[start] + 2 {
                next += 1
            }
            dp[start] = max((end - start + 1) * power[start] + helper(next),  helper(end + 1))
            return dp[start]
        }
        return helper()
    }
    
    func tests() {
        print(maximumTotalDamage([1,1,3,4])) // 6
        print(maximumTotalDamage([7,1,6,6])) // 13
    }
}
