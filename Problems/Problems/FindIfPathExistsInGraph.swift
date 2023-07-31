class FindIfPathExistsInGraph {
    func validPath(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
        guard !edges.isEmpty else { return true }
        var adjacencies: [Int: [Int]] = [:]
        for edge in edges {
            adjacencies[edge[0], default: []].append(edge[1])
            adjacencies[edge[1], default: []].append(edge[0])
        }
        var visited: Set<Int> = []
        var queue: [Int] = [source]
        while !queue.isEmpty {
            let q = queue.removeFirst()
            guard !visited.contains(q) else {
                continue
            }
            guard let adjs = adjacencies[q] else {
                visited.insert(q)
                continue
            }
            for adj in adjs {
                if adj == destination { return true }
                queue.append(adj)
            }
            visited.insert(q)
        }
        
        return false
    }

    func tests() {
        print(validPath(3, [[0,1],[1,2],[2,0]], 0, 2)) // true
        print(validPath(6, [[0,1],[0,2],[3,5],[5,4],[4,3]], 0, 5)) // false
        print(validPath(6, [[0,1],[0,2],[3,5],[5,4],[3,4]], 0, 5)) // false
        print(validPath(10, [[2,9],[7,8],[5,9],[7,2],[3,8],[2,8],[1,6],[3,0],[7,0],[8,5]], 1, 0)) // false
    }
}
