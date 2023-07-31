class MinimumCostToCutAStick {
    func minCost(_ n: Int, _ cuts: [Int]) -> Int {
        var memo: [Int: Int] = [:]
        let cuts = [0] + cuts.sorted() + [n]
        func reverse(_ from: Int, _ to: Int) -> Int {
            let memoKey = from * 100 + to
            if let value = memo[memoKey] { return value }
            guard to - from >= 2 else { return 0 }
            guard to - from > 2 else { return cuts[to] - cuts[from] }
            memo[memoKey] = (from + 1...to - 1).map {
                cuts[to] - cuts[from] + reverse(from, $0) + reverse($0, to)
            }.min() ?? 0
            return memo[memoKey]!
        }
        return reverse(0, cuts.count - 1)
    }

    func tests() {
        print(minCost(7, [1,3,4,5])) // 16
        print(minCost(9, [5,6,1,4,2])) // 22
    }
}
