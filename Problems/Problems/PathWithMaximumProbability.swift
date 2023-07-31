class PathWithMaximumProbability {
    func maxProbability(_ n: Int, _ edges: [[Int]], _ succProb: [Double], _ start: Int, _ end: Int) -> Double {
        var maxProb = Array(repeating: 0.0, count: n)
        maxProb[start] = 1.0
        var changed = true
        while changed {
            changed = false
            for (edge, p) in zip(edges,succProb) {
                let (mu, mv) = (maxProb[edge[0]], maxProb[edge[1]])
                let (pu, pv) = (mu * p, mv * p)
                maxProb[edge[0]] = max(pv, mu)
                maxProb[edge[1]] = max(pu, mv)
                changed = changed || pu > mv || pv > mu
            }
        }
        return maxProb[end]
    }

    func maxProbability2(_ n: Int, _ edges: [[Int]], _ succProb: [Double], _ start: Int, _ end: Int) -> Double {
        var graph: [Int: [(Int, Double)]] = [:]
        
        for (i, edge) in edges.enumerated() {
            let prob = succProb[i]
            graph[edge[0], default: []].append((edge[1], prob))
            graph[edge[1], default: []].append((edge[0], prob))
        }
        
        var queue = [start]
        
        while !queue.isEmpty {
            
        }
        
        return 0
    }

    func tests() {
        print(maxProbability(3, [[0,1],[1,2],[0,2]], [0.5,0.5,0.2], 0, 2)) // 0.25000
        print(maxProbability(3, [[0,1],[1,2],[0,2]], [0.5,0.5,0.3], 0, 2)) // 0.30000
        print(maxProbability(3, [[0,1]], [0.5], 0, 2)) // 0.00000
    }
}

