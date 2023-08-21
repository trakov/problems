class FindCriticalAndPseudoCriticalEdgesInMinimumSpanningTree {
    struct Edge {
        let u: Int
        let v: Int
        let weight: Int
        let index: Int
    }

    func findCriticalAndPseudoCriticalEdges(_ n: Int, _ edges: [[Int]]) -> [[Int]] {
        let edges = edges.enumerated().map { (index, edge) in
            Edge(u: edge[0], v: edge[1], weight: edge[2], index: index)
        }.sorted { $0.weight < $1.weight }

        let mstWeight = findWeight(n, edges)
        var critical: [Int] = []
        var pseudo: [Int] = []

        for i in edges.indices {
            if findWeight(n, edges, skip: i) > mstWeight {
                critical.append(edges[i].index)
            } else if findWeight(n, edges, pick: i) == mstWeight {
                pseudo.append(edges[i].index)
            }
        }

        return [critical, pseudo]
    }
    
    func findWeight(_ n: Int, _ edges: [Edge], skip: Int? = nil, pick: Int? = nil) -> Int {
        var parents = Array(repeating: 0, count: n)
        parents.indices.forEach { parents[$0] = $0 }

        func find(_ parents: inout [Int], _ x: Int) -> Int {
            if parents[x] != x {
                parents[x] = find(&parents, parents[x])
            }
            return parents[x]
        }

        func union(_ parents: inout [Int], _ x: Int, _ y: Int) -> Bool {
            let rootX = find(&parents, x)
            let rootY = find(&parents, y)
            if rootX == rootY { return false }
            parents[rootY] = rootX
            return true
        }

        var weight = 0
        var count = 0

        if let pick = pick {
            union(&parents, edges[pick].u, edges[pick].v)
            weight += edges[pick].weight
            count += 1
        }

        for i in edges.indices {
            if i == skip { continue }
            let edge = edges[i]
            if union(&parents, edge.u, edge.v) {
                weight += edge.weight
                count += 1
            }
        }

        return count == n - 1 ? weight : Int.max
    }
    
    func tests() {
        print(findCriticalAndPseudoCriticalEdges(5, [[0,1,1],[1,2,1],[2,3,2],[0,3,2],[0,4,3],[3,4,3],[1,4,6]]))
        // [[0,1],[2,3,4,5]]
        print(findCriticalAndPseudoCriticalEdges(4, [[0,1,1],[1,2,1],[2,3,1],[0,3,1]]))
        // [[],[0,1,2,3]]
    }
}

