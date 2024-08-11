class CounttheNumberofGoodNodes {
    func countGoodNodes(_ edges: [[Int]]) -> Int {
        let n = edges.count + 1
        var graph: [Int: Set<Int>] = [:]
        for edge in edges {
            graph[edge[0], default: []].insert(edge[1])
            graph[edge[1], default: []].insert(edge[0])
        }
        var result = 0
        var visited = Array(repeating: false, count: n)
        
        @discardableResult
        func dfs(_ node: Int) -> Int {
            var prev = -1
            var equal = true
            var size = 0
            visited[node] = true
            for edge in graph[node] ?? [] where !visited[edge] {
                let temp = dfs(edge)
                size += temp + 1
                if prev == -1 || prev == temp {
                    prev = temp
                } else {
                    equal = false
                }
            }
            if equal { result += 1 }
            return size
        }
        dfs(0)
        return result
    }
    
    func tests() {
        print(countGoodNodes([[0,1],[0,2],[1,3],[1,4],[2,5],[2,6]])) // 7
        print(countGoodNodes([[0,1],[1,2],[2,3],[3,4],[0,5],[1,6],[2,7],[3,8]])) // 6
        print(countGoodNodes([
            [0,1],[1,2],[1,3],[1,4],[0,5],[5,6],[6,7],[7,8],[0,9],[9,10],[9,12],[10,11]
        ])) // 12
    }
}

