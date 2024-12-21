class MaximumNumberofKDivisibleComponents {
    func maxKDivisibleComponents(_ n: Int, _ edges: [[Int]], _ values: [Int], _ k: Int) -> Int {
        guard n > 1 else { return 1 }
        var values = values
        var count = 0
        var graph = edges.reduce(into: [Set<Int>](repeating: [], count:n)) { graph, edge in
            graph[edge[0]].insert(edge[1])
            graph[edge[1]].insert(edge[0])
        }
        let isLeaf = { (i: Int) in graph[i].count == 1 }
        var queue = graph.indices.filter(isLeaf)
        while let node = queue.popLast() {
            count += values[node] % k == 0 ? 1 : 0
            guard let adjacent = graph[node].first else { continue }
            graph[node].remove(adjacent)
            graph[adjacent].remove(node)
            values[adjacent] += values[node] % k
            guard isLeaf(adjacent) else { continue }
            queue.append(adjacent)
        }
        return count
    }
    
    func tests() {
        print(maxKDivisibleComponents(5, [[0,2],[1,2],[1,3],[2,4]], [1,8,1,4,4], 6)) // 2
        print(maxKDivisibleComponents(7, [[0,1],[0,2],[1,3],[1,4],[2,5],[2,6]], [3,0,6,1,5,2,1], 3)) // 3
    }
}

