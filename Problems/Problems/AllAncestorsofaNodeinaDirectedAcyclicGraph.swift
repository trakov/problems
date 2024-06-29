class AllAncestorsofaNodeinaDirectedAcyclicGraph {
    func getAncestors(_ n: Int, _ edges: [[Int]]) -> [[Int]] {
        var adjacencyList = Array(repeating: [Int](), count: n)
        for edge in edges {
            adjacencyList[edge[1]].append(edge[0])
        }
        
        func dfs(_ currentNode: Int, _ visitedNodes: inout Set<Int>) {
            visitedNodes.insert(currentNode)
            for neighbour in adjacencyList[currentNode] {
                if !visitedNodes.contains(neighbour) {
                    dfs(neighbour, &visitedNodes)
                }
            }
        }

        var result = Array(repeating: [Int](), count: n)
        for i in 0..<n {
            var ancestors: [Int] = []
            var visited: Set<Int> = []
            dfs(i, &visited)
            for node in 0..<n where node != i && visited.contains(node) {
                ancestors.append(node)
            }
            result[i] = ancestors
        }
        return result
    }

    func tests() {
        print(getAncestors(
            8, [[0,3],[0,4],[1,3],[2,4],[2,7],[3,5],[3,6],[3,7],[4,6]]
        )) // [[],[],[],[0,1],[0,2],[0,1,3],[0,1,2,3,4],[0,1,2,3]]
        print(getAncestors(
            5, [[0,1],[0,2],[0,3],[0,4],[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]
        )) // [[],[0],[0,1],[0,1,2],[0,1,2,3]]
    }
}

