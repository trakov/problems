class FindClosestNodeToGivenTwoNodes {
    func closestMeetingNode(_ edges: [Int], _ node1: Int, _ node2: Int) -> Int {
        let n = edges.count
        var dist1: [Int] = Array(repeating: Int.max, count: n)
        var dist2: [Int] = Array(repeating: Int.max, count: n)

        func bfs(startNode: Int, edges: [Int], dist: inout [Int]) {
            var q: [Int] = [startNode]
            var visit: [Bool] = Array(repeating: false, count: n)
            dist[startNode] = 0

            while !q.isEmpty {
                let node = q.removeFirst()

                if visit[node] {
                    continue
                }

                visit[node] = true
                let neighbor = edges[node]
                if (neighbor != -1 && !visit[neighbor]) {
                    dist[neighbor] = 1 + dist[node]
                    q.append(neighbor)
                }
            }
        }

        bfs(startNode: node1, edges: edges, dist: &dist1)
        bfs(startNode: node2, edges: edges, dist: &dist2)

        var minDistNode = -1
        var minDistTillNow = Int.max
        for currNode in 0..<n {
            if minDistTillNow > max(dist1[currNode], dist2[currNode]) {
                minDistNode = currNode
                minDistTillNow = max(dist1[currNode], dist2[currNode])
            }
        }
        return minDistNode
    }

    func tests() {
        print(closestMeetingNode([2,2,3,-1], 0, 1)) // 2
        print(closestMeetingNode([1,2,-1], 0, 2)) // 2
    }
}
