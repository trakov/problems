class EvaluateDivision {
    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        guard !equations.isEmpty else { return Array(repeating: -1, count: queries.count) }
        var graph: [String: [String: Double]] = [:]
        for (eq, val) in zip(equations, values) {
            graph[eq[0], default: [:]][eq[1]] = val
            graph[eq[1], default: [:]][eq[0]] = 1/val
        }
        
        func bfs(_ query: [String]) -> Double {
            let (start, end) = (query[0], query[1])
            guard graph[start] != nil, graph[end] != nil else { return -1 }
            guard start != end else { return 1 }
            var q = [(start, 1.0)]
            var visited = Set([start])
            while !q.isEmpty {
                let (node, val) = q.removeLast()
                for (n, v) in graph[node]! {
                    guard !visited.contains(n) else { continue }
                    guard n != end else { return val * v }
                    q.append((n, val * v))
                    visited.insert(n)
                }
            }
            return -1
        }
        
        return queries.map(bfs)
    }
    
    func tests() {
        print(calcEquation(
            [["a","b"],["b","c"]],
            [2.0,3.0],
            [["a","c"],["b","a"],["a","e"],["a","a"],["x","x"]]
        )) // [6.00000,0.50000,-1.00000,1.00000,-1.00000]
        print(calcEquation(
            [["a","b"],["b","c"],["bc","cd"]],
            [1.5,2.5,5.0],
            [["a","c"],["c","b"],["bc","cd"],["cd","bc"]]
        )) // [3.75000,0.40000,5.00000,0.20000]
        print(calcEquation(
            [["a","b"]],
            [0.5],
            [["a","b"],["b","a"],["a","c"],["x","y"]]
        )) // [0.50000,2.00000,-1.00000,-1.00000]
    }
}

