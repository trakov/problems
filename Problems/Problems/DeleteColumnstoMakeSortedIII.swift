final class DeleteColumnstoMakeSortedIII {
    func minDeletionSize(_ strs: [String]) -> Int {
        let n = strs[0].count
        guard n > 1 else { return 0 }
        let strs = strs.map(Array.init)
        var dp = Array(repeating: 1, count: n)
        for i in (0...n-2).reversed() {
            for j in i+1..<n {
                var next = false
                for row in strs where row[i] > row[j] {
                    next = true
                    break
                }
                if next { continue }
                dp[i] = max(dp[i], 1 + dp[j])
            }
        }
        return n - dp.max()!
    }
    
    func tests() {
        print(minDeletionSize(["babca","bbazb"])) // 3
        print(minDeletionSize(["edcba"])) // 4
        print(minDeletionSize(["ghi","def","abc"])) // 0
    }
}
