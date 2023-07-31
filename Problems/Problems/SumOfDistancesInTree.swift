class SumOfDistancesInTree {
    func sumOfDistancesInTree(_ n: Int, _ edges: [[Int]]) -> [Int] {
        guard n > 0 else { return [] }
        guard n > 1 else { return [0] }
        guard n > 2 else { return [1,1] }
        var result = Array(repeating: 0, count: n)
        var count = Array(repeating: 1, count: n)
        let graph = edges.reduce(into: Array(repeating: [Int](), count: n)) { graph, edge in
            graph[edge[0]].append(edge[1])
            graph[edge[1]].append(edge[0])
        }

        func dfs(pass: Int, _ node: Int = 0, _ parent: Int = -1) {
            for child in graph[node] where child != parent {
                if pass == 2 {
                    result[child] = (result[node] + n) - 2 * count[child]
                }
                dfs(pass: pass, child, node)
                if pass == 1 {
                    count[node] += count[child]
                    result[node] += result[child] + count[child]
                }
            }
        }
        
        dfs(pass: 1)
        dfs(pass: 2)
        return result
    }

    func tests() {
        print(sumOfDistancesInTree(6, [[0,1],[0,2],[2,3],[2,4],[2,5]])) // [8,12,6,10,10,10]
        print(sumOfDistancesInTree(1, [])) // [0]
        print(sumOfDistancesInTree(2, [[1,0]])) // [1,1]
    }
}
