class MinimumCostWalkinWeightedGraph {
    var parent: [Int] = []
    var depth: [Int] = []

    func minimumCost(_ n: Int, _ edges: [[Int]], _ query: [[Int]]) -> [Int] {
        parent = Array(repeating: -1, count: n)
        depth = Array(repeating: 0, count: n)
        var componentCost = Array(repeating: Int.max, count: n)
        for edge in edges {
            union(edge[0], edge[1])
        }
        for edge in edges {
            let root = find(edge[0])
            componentCost[root] &= edge[2]
        }
        var result = Array(repeating: 0, count: query.count)
        for (i, q) in query.enumerated() {
            let start = q[0]
            let end = q[1]
            if find(start) != find(end) {
                result[i] = -1
            } else {
                let root = find(start)
                result[i] = componentCost[root]
            }
        }
        return result
    }

    private func find(_ node: Int) -> Int {
        if parent[node] == -1 { return node }
        parent[node] = find(parent[node])
        return parent[node]
    }

    private func union(_ node1: Int, _ node2: Int) {
        var root1 = find(node1)
        var root2 = find(node2)
        if root1 == root2 { return }
        if depth[root1] < depth[root2] {
            (root1, root2) = (root2, root1)
        }
        parent[root2] = root1
        if depth[root1] == depth[root2] {
            depth[root1] += 1
        }
    }

    func tests() {
        print(minimumCost(5, [[0,1,7],[1,3,7],[1,2,1]], [[0,3],[3,4]])) // [1,-1]
        print(minimumCost(3, [[0,2,7],[0,1,15],[1,2,6],[1,2,1]], [[1,2]])) // [0]
    }
}
