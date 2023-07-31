class RemoveMaxNumberOfEdgesToKeepGraphFullyTraversable {
    func maxNumEdgesToRemove(_ n: Int, _ edges: [[Int]]) -> Int {
        var parent = Array(0..<n)
        var counts = Array(repeating: 0, count: 3)
        handleType(edges, &counts, &parent, 3, n)
        if counts[2] == n - 1 { return edges.count - counts[2] }
        counts[0] = counts[2]
        counts[1] = counts[2]
        var copy = parent
        handleType(edges, &counts, &parent, 1, n)
        if counts[0] < n - 1 { return -1 }
        handleType(edges, &counts, &copy, 2, n)
        if counts[1] < n - 1 { return -1 }
        return edges.count + counts[2] - counts[0] - counts[1]
    }
    
    private func handleType(_ edges: [[Int]], _ counts: inout [Int], _ parent: inout [Int], _ type: Int, _ n: Int) {
        for edge in edges {
            if type == edge[0] {
                let a = edge[1] - 1
                let b = edge[2] - 1
                let parentA = find(a, &parent)
                let parentB = find(b, &parent)
                if parentA == parentB { continue }
                parent[parentA] = parentB
                counts[type - 1] += 1
                if counts[type - 1] == n - 1 { return }
            }
        }
    }
    
    private func find(_ cur: Int, _ parent: inout [Int]) -> Int {
        if parent[cur] == cur { return cur }
        parent[cur] = find(parent[cur], &parent)
        return parent[cur]
    }
    
    func tests() {
        print(maxNumEdgesToRemove(4, [[3,1,2],[3,2,3],[1,1,3],[1,2,4],[1,1,2],[2,3,4]])) // 2
        print(maxNumEdgesToRemove(4, [[3,1,2],[3,2,3],[1,1,4],[2,1,4]])) // 0
        print(maxNumEdgesToRemove(4, [[3,2,3],[1,1,2],[2,3,4]])) // -1
    }
}

