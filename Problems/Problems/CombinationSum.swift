class CombinationSum {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard coins.count > 1 else {
            if amount % coins[0] == 0 { return amount / coins[0] }
            return -1
        }
        var result = [Int](repeating: amount + 1, count: amount + 1)
        result[0] = 0
        for i in 1..<amount + 1 {
            for c in coins {
                if c <= i {
                    result[i] = min(result[i], result[i - c] + 1)
                }
            }
        }
        return result[amount] > amount ? -1 : result[amount]
    }

    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        guard candidates.count > 1 else {
            let cand = candidates[0]
            if target % cand == 0 { return [Array(repeating: cand, count: target/cand)] }
            return []
        }
        var dp: [Set<[Int]>] = Array(repeating: Set<[Int]>(), count: target + 1)
        
        for i in 1..<dp.count {
            for candidate in candidates {
                guard i >= candidate else { continue }
                if candidate == i {
                    dp[i].insert([candidate])
                }
                if !dp[i - candidate].isEmpty {
                    var updated: Set<[Int]> = []
                    for arr in dp[i - candidate] {
                        updated.insert((arr + [candidate]).sorted())
                    }
                    dp[i].formUnion(updated)
                }
            }
        }
        
        return Array(dp[dp.count - 1])
    }

    func tests() {
        print(combinationSum([2,3,6,7], 7)) // [[2,2,3],[7]]
        print(combinationSum([2,3,5], 8)) // [[2,2,2,2],[2,3,3],[3,5]]
        print(combinationSum([2], 1)) // []
    }
}
