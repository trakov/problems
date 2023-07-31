class AllPathsFromSourceToTarget {
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        var result: [[Int]] = []
        fill(candidates: [[0]], result: &result, node: 0, graph: graph)
        return result
    }

    func fill(candidates: [[Int]], result: inout [[Int]], node: Int, graph: [[Int]]) {
        var newCandidates: [[Int]] = []
        var next = -1
        for path in candidates {
            if path.last == node {
                for n in graph[node] {
                    if n == graph.count - 1 {
                        result.append(path + [n])
                    } else {
                        newCandidates.append(path + [n])
                        next = n
                    }
                }
            } else {
                newCandidates.append(path)
                next = path.last!
            }
        }
        guard next != -1 else { return }
        fill(candidates: newCandidates, result: &result, node: next, graph: graph)
    }
    
    func tests() {
        print(allPathsSourceTarget([[1,2],[3],[3],[]])) // [[0,1,3],[0,2,3]]
        print(allPathsSourceTarget([[4,3,1],[3,2,4],[3],[4],[]])) // [[0,4],[0,3,4],[0,1,3,4],[0,1,2,3,4],[0,1,4]]
    }
}
