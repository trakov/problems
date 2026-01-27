import Collections
final class MinimumCostPathwithEdgeReversals {
    struct DistNode: Comparable {
        let dist: Int
        let node: Int
        static func < (lhs: DistNode, rhs: DistNode) -> Bool {
            lhs.dist < rhs.dist
        }
    }
    func minCost(_ n: Int, _ edges: [[Int]]) -> Int {
        var g = Array(repeating: [[Int]](), count: n)
        for e in edges {
            let (x, y, w) = (e[0], e[1], e[2])
            g[x].append([y, w])
            g[y].append([x, 2 * w])
        }
        var d = Array(repeating: Int.max, count: n)
        var visited = Array(repeating: false, count: n)
        d[0] = 0
        var pq = Collections.Heap<DistNode>()
        pq.insert(DistNode(dist: 0, node: 0))
        while !pq.isEmpty {
            let current = pq.removeMin()
            let (dist, node) = (current.dist, current.node)
            if node == n - 1 {
                return dist
            }
            guard !visited[node] else { continue }
            visited[node] = true
            for neighbor in g[node] {
                let (y, w) = (neighbor[0], neighbor[1])
                if dist + w < d[y] {
                    d[y] = dist + w
                    pq.insert(DistNode(dist: d[y], node: y))
                }
            }
        }
        return -1
    }
    
    func tests() {
        print(minCost(4, [[0,1,3],[3,1,1],[2,3,4],[0,2,2]])) // 5
        print(minCost(4, [[0,2,1],[2,1,1],[1,3,1],[2,3,3]])) // 3
    }
}
