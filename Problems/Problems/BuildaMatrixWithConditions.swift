class BuildaMatrixWithConditions {
    func buildMatrix(_ k: Int, _ rowConditions: [[Int]], _ colConditions: [[Int]]) -> [[Int]] {
        func array(of conditions: [[Int]]) -> [Int]? {
            var graph = Array(repeating: Set<Int>(), count: k + 1)
            for cond in conditions {
                graph[cond[0]].insert(cond[1])
            }
            var result: [Int] = []
            var visited = Array(repeating: 0, count: k + 1)
            func dfs(_ node: Int) -> Bool {
                visited[node] = 1
                for neighbor in graph[node] {
                    if visited[neighbor] == 0 {
                        if !dfs(neighbor) { return false }
                    } else if visited[neighbor] == 1 {
                        return false
                    }
                }
                visited[node] = 2
                result.append(node)
                return true
            }
            for i in 1...k {
                guard visited[i] == 0 else { continue }
                guard dfs(i) else { return nil }
            }
            return result.reversed()
        }
        guard let topToBootom = array(of: rowConditions) else { return [] }
        guard let leftToRight = array(of: colConditions) else { return [] }
        var result = Array(repeating: Array(repeating: 0, count: k), count: k)
        for (i, val) in topToBootom.enumerated() {
            guard let j = leftToRight.firstIndex(of: val) else { return [] }
            result[i][j] = val
        }
        return result
    }
    
    func tests() {
        print(buildMatrix(3, [[1,2],[3,2]], [[2,1],[3,2]]))
        // [[3,0,0],[0,0,1],[0,2,0]]
        print(buildMatrix(3, [[1,2],[2,3],[3,1],[2,3]], [[2,1]])) // []
    }
}

