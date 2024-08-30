class ModifyGraphEdgeWeights {
    let INF = 1_000_000_000

    func modifiedGraphEdges(
        _ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int, _ target: Int
    ) -> [[Int]] {
        
        func runDijkstra(_ edges: [[Int]]) -> Int {
            var adjMatrix = Array(
                repeating: Array(repeating: INF, count: n), count: n
            )
            var minDistance = Array(repeating: INF, count: n)
            var visited = Array(repeating: false, count: n)
            minDistance[source] = 0;
            for edge in edges {
                if edge[2] != -1 {
                    adjMatrix[edge[0]][edge[1]] = edge[2]
                    adjMatrix[edge[1]][edge[0]] = edge[2]
                }
            }
            
            for _ in 0..<n {
                // Find the nearest unvisited node
                var nearestUnvisitedNode = -1
                for j in 0..<n {
                    if !visited[j] &&
                        (nearestUnvisitedNode == -1 ||
                         minDistance[j] < minDistance[nearestUnvisitedNode]) {
                        nearestUnvisitedNode = j;
                    }
                }
                visited[nearestUnvisitedNode] = true
                for v in 0..<n {
                    minDistance[v] = min(
                        minDistance[v],
                        minDistance[nearestUnvisitedNode] +
                        adjMatrix[nearestUnvisitedNode][v]
                    )
                }
            }
            return minDistance[destination]
        }

        let currentShortestDistance = runDijkstra(edges)

        if currentShortestDistance < target { return [] }

        var matchesTarget = currentShortestDistance == target

        var edges = edges
        for i in 0..<edges.count where edges[i][2] < 0 {
            var edge = edges[i]
            edge[2] = matchesTarget ? INF : 1
            edges[i] = edge
            if !matchesTarget {
                let newDistance = runDijkstra(edges)
                if newDistance <= target {
                    matchesTarget = true
                    edge[2] += target - newDistance
                    edges[i] = edge
                }
            }
        }
        return matchesTarget ? edges : []
    }
    
    func tests() {
        print(modifiedGraphEdges(
            5, [[4,1,-1],[2,0,-1],[0,3,-1],[4,3,-1]], 0, 1, 5
        )) // [[4,1,1],[2,0,1],[0,3,3],[4,3,1]]
        print(modifiedGraphEdges(
            3, [[0,1,-1],[0,2,5]], 0, 2, 6
        )) // []
    }
}

