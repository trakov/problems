class ShortestReach {
    func bfs(n: Int, m: Int, edges: [[Int]], s: Int) -> [Int] {
        var map: [Int: Set<Int>] = [:]
        for edge in edges {
            map[edge[0], default: []].insert(edge[1])
            map[edge[1], default: []].insert(edge[0])
        }
        var result = Array(repeating: -1, count: n + 1)
        result[s] = -2
        var queue: Set<Int> = map[s] ?? []
        var level = 1
        while !queue.isEmpty {
            var newQueue: Set<Int> = []
            for node in queue where result[node] == -1 {
                result[node] = level * 6
                newQueue.formUnion(map[node] ?? [])
            }
            level += 1
            queue = newQueue
        }
        result.remove(at: s)
        result.removeFirst()
        return result
    }
    
    func tests() {
        print(bfs(n: 5, m: 3, edges: [[1,2],[1,3],[3,4]], s: 1)) // [6,6,12,-1]
    }
}

