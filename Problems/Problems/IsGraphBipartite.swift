class IsGraphBipartite {
    func isBipartite(_ graph: [[Int]]) -> Bool {
        let n = graph.count
        guard n > 1 else { return false }
        var color = Array(repeating: -1, count: n)
        for i in 0..<n where color[i] == -1 {
            color[i] = 0
            var stack = [i]
            while let node = stack.popLast() {
                for neighbor in graph[node] {
                    if color[node] == color[neighbor] {
                        return false
                    } else if color[neighbor] == -1 {
                        color[neighbor] = 1 - color[node]
                        stack.append(neighbor)
                    }
                }
            }
        }
        return true
    }
    
    func tests() {
        print(isBipartite([[1,2,3],[0,2],[0,1,3],[0,2]])) // false
        print(isBipartite([[1,3],[0,2],[1,3],[0,2]])) // true
    }
}

