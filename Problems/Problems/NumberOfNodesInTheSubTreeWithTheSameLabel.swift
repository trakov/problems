class NumberOfNodesInTheSubTreeWithTheSameLabel {
    func countSubTrees(_ n: Int, _ edges: [[Int]], _ labels: String) -> [Int] {
        let graph = edges.reduce(into: Array(repeating: [Int](), count:n)) { graph, edge in
            graph[edge[0]].append(edge[1])
            graph[edge[1]].append(edge[0])
        }
        let labels = labels.map { Int($0.asciiValue!) - 97 }
        var result = Array(repeating: 0, count: n)
        var ancestors = Array(repeating: [Int](), count: 26)
        
        func visit(_ node: Int, _ label: Int) {
            ancestors[label].append(node)
            ancestors[label].forEach { i in
                result[i] += 1
            }
            for child in graph[node] where result[child] == 0 {
                visit(child, labels[child])
            }
            ancestors[label].removeLast()
        }
        
        visit(0, labels[0])
        return result
    }

    func countSubTrees2(_ n: Int, _ edges: [[Int]], _ labels: String) -> [Int] {
        guard n > 1 else { return [1] }
        var graph = Array(repeating: [Int](), count: n)
        for edge in edges {
            graph[edge[0]].append(edge[1])
            graph[edge[1]].append(edge[0])
        }
        var parentsList = Array(repeating: -1, count: n)
        let labels = Array(labels)
        var result = Array(repeating: 1, count: n)
        
        func dfs(node: Int, parent: Int) {
            for child in graph[node] {
                guard child != parent else { continue }
                parentsList[child] = node
                var p = node
                while p > -1 {
                    if labels[child] == labels[p] {
                        result[p] += 1
                    }
                    p = parentsList[p]
                }
                dfs(node: child, parent: node)
            }
        }
        dfs(node: 0, parent: -1)
        return result
    }

    func tests() {
        print(countSubTrees(7, [[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]], "abaedcd")) // [2,1,1,1,1,1,1]
        print(countSubTrees(4, [[0,1],[1,2],[0,3]], "bbbb")) // [4,2,1,1]
        print(countSubTrees(5, [[0,1],[0,2],[1,3],[0,4]], "aabab")) // [3,2,1,1,1]
    }
}
