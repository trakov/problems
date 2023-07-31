class CountUnreachablePairsOfNodesInAnUndirectedGraph {
    func countPairs(_ n: Int, _ edges: [[Int]]) -> Int {
        guard n > 1 else { return 0 }
        var graph: [Int: Set<Int>] = [:]
        for edge in edges {
            graph[edge[0], default: []].insert(edge[1])
            graph[edge[1], default: []].insert(edge[0])
        }
        var components: [Int] = []
        var visited = Array(repeating: false, count: n)
        for i in 0..<n {
            guard !visited[i] else { continue }
            visited[i] = true
            var queue: [Int] = [i]
            var count = 0
            while !queue.isEmpty {
                count += queue.count
                var nextQueue: [Int] = []
                for q in queue {
                    for neigh in graph[q] ?? [] where visited[neigh] == false {
                        nextQueue.append(neigh)
                        visited[neigh] = true
                    }
                }
                queue = nextQueue
            }
            components.append(count)
        }
        
        guard components.count > 1 else { return 0 }
        var result = 0
        for i in 0..<components.count {
            result += components[i] * (n - components[i])
        }
        return result / 2
    }
    
    func tests() {
        print(countPairs(3, [[0,1],[0,2],[1,2]])) // 0
        print(countPairs(7, [[0,2],[0,5],[2,4],[1,6],[5,4]])) // 14
    }
}

