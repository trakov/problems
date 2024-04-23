class MinimumHeightTrees {
    func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
        guard n > 1 else { return [0] }
        var graph: [Int: Set<Int>] = [:]
        for edge in edges {
            graph[edge[0], default: []].insert(edge[1])
            graph[edge[1], default: []].insert(edge[0])
        }
        while graph.count > 2 {
            for (node, neighs) in graph where neighs.count == 1 {
                graph[node] = nil
                graph[neighs.first!]?.remove(node)
            }
        }
        return Array(graph.keys)
    }

    // TLE
    func findMinHeightTrees2(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var graph = Array(repeating: Set<Int>(), count: n)
        for edge in edges {
            graph[edge[0]].insert(edge[1])
            graph[edge[1]].insert(edge[0])
        }
        var result: [Int] = []
        var minHeight = n
        for i in 0..<n {
            var h = 0
            var queue = [i]
            var visited: Set<Int> = [i]
            while !queue.isEmpty {
                var nextQueue: [Int] = []
                for q in queue {
                    nextQueue.append(contentsOf: graph[q].subtracting(visited))
                    visited.insert(q)
                }
                queue = nextQueue
                h += 1
            }
            if minHeight == h {
                result.append(i)
            } else if h < minHeight {
                result = [i]
                minHeight = h
            }
        }
        return result
    }
    
    func tests() {
        print(findMinHeightTrees(1, [])) // [0]
        print(findMinHeightTrees(2, [[0,1]])) // [0,1]
        print(findMinHeightTrees(4, [[1,0],[1,2],[1,3]])) // [1]
        print(findMinHeightTrees(6, [[3,0],[3,1],[3,2],[3,4],[5,4]])) // [3,4]
    }
}

