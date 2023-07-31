class NumberOfOperationsToMakeNetworkConnected {
    func makeConnected(_ n: Int, _ connections: [[Int]]) -> Int {
        guard connections.count >= n - 1 else { return -1 }
        var components = n
        var graph = Array(0..<n)

        for connection in connections {
            var os = graph[connection[0]]
            while graph[os] != os { os = graph[os] }
            var od = graph[connection[1]]
            while graph[od] != od { od = graph[od] }
            if os != od {
                graph[od] = os
                components -= 1
            }
        }
        return components - 1
    }

    func makeConnected2(_ n: Int, _ connections: [[Int]]) -> Int {
        guard connections.count >= n - 1 else { return -1 }
        var map: [Int: Set<Int>] = [:]
        for connection in connections {
            map[connection[0], default: []].insert(connection[1])
            map[connection[1], default: []].insert(connection[0])
        }
        var components = 0
        var visited: Set<Int> = []
        while !map.isEmpty {
            var (comp, queue) = map.first!
            visited.insert(comp)
            while !queue.isEmpty {
                var nextQueue: Set<Int> = []
                for q in queue {
                    if let comps = map[q] {
                        visited.insert(q)
                        nextQueue.formUnion(comps)
                    }
                    map[q] = nil
                }
                queue = nextQueue
            }
            map[comp] = nil
            components += 1
        }
        
        return n - visited.count + components - 1
    }

    func tests() {
        print(makeConnected(4, [[0,1],[0,2],[1,2]])) // 1
        print(makeConnected(6, [[0,1],[0,2],[0,3],[1,2],[1,3]])) // 2
        print(makeConnected(6, [[0,1],[0,2],[0,3],[1,2]])) // -1
    }
}
