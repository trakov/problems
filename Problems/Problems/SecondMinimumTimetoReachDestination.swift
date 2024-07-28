class SecondMinimumTimetoReachDestination {
    func secondMinimum(
        _ n: Int, _ edges: [[Int]], _ time: Int, _ change: Int
    ) -> Int {
        var graph: [Int: [Int]] = [:]
        for edge in edges {
            graph[edge[0], default: []].append(edge[1])
            graph[edge[1], default: []].append(edge[0])
        }
        var dist1 = Array(repeating: -1, count: n + 1)
        var dist2 = Array(repeating: -1, count: n + 1)
        dist1[1] = 0
        var queue = [(1, 1)]
        while !queue.isEmpty {
            let (node, freq) = queue.removeFirst()
            var timeTaken = freq == 1 ? dist1[node] : dist2[node]
            if (timeTaken / change) % 2 == 1 {
                timeTaken = change * (timeTaken / change + 1) + time
            } else {
                timeTaken += time
            }
            guard let nodes = graph[node] else { continue }
            for neighbor in nodes {
                if dist1[neighbor] == -1 {
                    dist1[neighbor] = timeTaken
                    queue.append((neighbor, 1))
                } else if dist2[neighbor] == -1 && dist1[neighbor] != timeTaken {
                    if neighbor == n { return timeTaken }
                    dist2[neighbor] = timeTaken
                    queue.append((neighbor, 2))
                }
            }
        }
        return 0
    }
    
    func tests() {
        print(secondMinimum(5, [[1,2],[1,3],[1,4],[3,4],[4,5]], 3, 5)) // 13
        print(secondMinimum(2, [[1,2]], 3, 2)) // 11
    }
}

