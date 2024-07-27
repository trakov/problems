class MinimumCosttoConvertStringI {
    func minimumCost(
        _ source: String, _ target: String,
        _ original: [Character], _ changed: [Character], _ cost: [Int]
    ) -> Int {
        var graph = Array(repeating: Array(repeating: Int.max, count: 26), count: 26)
        let index = { (ch: Character) in Int(ch.asciiValue!) - 97 }
        var lower = 25
        var upper = 0
        for i in original.indices  {
            let (s,t) = (index(original[i]), index(changed[i]))
            graph[s][t] = min(graph[s][t], cost[i])
            lower = min(lower, s, t)
            upper = max(upper, s, t)
        }
        
        let range = lower...upper
        for i in range {
            for s in range {
                for t in range {
                    let (cost, overflow) = graph[s][i].addingReportingOverflow(graph[i][t])
                    guard !overflow, cost < graph[s][t] else { continue }
                    graph[s][t] = cost
                }
            }
        }
        var result = 0
        for (s,t) in zip(source,target) where s != t {
            let cost = graph[index(s)][index(t)]
            guard cost < .max else { return -1 }
            result += cost
        }
        return result
    }

    // doesn't work
    func minimumCost2(
        _ source: String, _ target: String,
        _ original: [Character], _ changed: [Character], _ cost: [Int]
    ) -> Int {
        var graph: [Character: [Character: Int]] = [:]
        for (i, o) in original.enumerated() {
            let ch = changed[i]
            graph[o, default: [:]][ch] = min(graph[o]?[ch] ?? Int.max, cost[i])
        }
        
        func dfs(_ c1: Character, _ c2: Character) -> Int? {
            guard c1 != c2 else { return 0 }
            guard let map = graph[c1] else { return nil }
            for (n, price) in map {
                guard let d = dfs(n, c2) else { return nil }
                graph[c1]![c2] = min(graph[c1]![c2] ?? Int.max, d + price)
            }
            return graph[c1]?[c2]
        }

        var result = 0
        for (c1, c2) in zip(source, target) {
            guard let c = dfs(c1, c2) else { return -1 }
            result += c
        }
        return result
    }
    
    func tests() {
        print(minimumCost(
            "abcd", "acbe",
            ["a","b","c","c","e","d"],
            ["b","c","b","e","b","e"],
            [2,5,5,1,2,20])
        ) // 28
        print(minimumCost(
            "aaaa", "bbbb", ["a","c"], ["c","b"], [1,2])
        ) // 12
        print(minimumCost(
            "abcd", "abce", ["a"], ["e"], [10000])
        ) // -1
        
        print(minimumCost(
            "aaaabadaaa", "dbdadddbad",
            ["c","a","c","a","a","b","b","b","d","d","c"],
            ["a","c","b","d","b","c","a","d","c","b","d"],
            [7,8,11,9,7,6,4,6,9,5,9])
        ) //
    }
}

