class DesignGraphWithShortestPathCalculator {
    class Graph {
        private var adjList: [[(Int, Int)]]

        init(_ n: Int, _ edges: [[Int]]) {
            adjList = Array(repeating: [], count: n)
            for edge in edges {
                addEdge(edge)
            }
        }
        
        func addEdge(_ edge: [Int]) {
            adjList[edge[0]].append((edge[1], edge[2]))
        }
        
        func shortestPath(_ node1: Int, _ node2: Int) -> Int {
            var dist = Array(repeating: Int.max, count: adjList.count)
            dist[node1] = 0
            var minHeap: [(Int, Int)] = [(dist[node1], node1)]
            while !minHeap.isEmpty {
                let (d, u) = minHeap.removeFirst()
                if u == node2 { return d }
                for (v, w) in adjList[u] {
                    if d + w < dist[v] {
                        dist[v] = d + w
                        minHeap.append((dist[v], v))
                    }
                }
                minHeap.sort { $0.0 < $1.0 }
            }
            return -1
        }
    }

    func tests() {
        var graph = Graph(4, [[0, 2, 5], [0, 1, 2], [1, 2, 1], [3, 0, 3]])
        print(graph.shortestPath(3, 2)) // 6
        print(graph.shortestPath(0, 3)) // -1
        print(graph.addEdge([1, 3, 4]))
        print(graph.shortestPath(0, 3)) // 6
    }
}

