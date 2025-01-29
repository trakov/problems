class RedundantConnection {
    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        let n = edges.count
        var visited = Array(repeating: false, count: n)
        var parent = Array(repeating: -1, count: n)
        var adjList = Array(repeating: [Int](), count: n)
        for edge in edges {
            adjList[edge[0] - 1].append(edge[1] - 1)
            adjList[edge[1] - 1].append(edge[0] - 1)
        }
        var cycleStart = -1
        func dfs(_ src: Int) {
            visited[src] = true
            for adj in adjList[src] {
                if !visited[adj] {
                    parent[adj] = src
                    dfs(adj)
                } else if adj != parent[src] && cycleStart == -1 {
                    cycleStart = adj
                    parent[adj] = src
                }
            }
        }
        dfs(0)
        var cycleNodes: [Int: Int] = [:]
        var node = cycleStart
        repeat {
            cycleNodes[node] = 1
            node = parent[node]
        } while node != cycleStart
        for edge in edges.reversed() {
            if cycleNodes[edge[0] - 1] != nil &&
                cycleNodes[edge[1] - 1] != nil {
                return edge
            }
        }
        return []
    }
    
    func tests() {
        print(findRedundantConnection([[1,2],[1,3],[2,3]])) // [2,3]
        print(findRedundantConnection([[1,2],[2,3],[3,4],[1,4],[1,5]])) // [1,4]
    }
}

