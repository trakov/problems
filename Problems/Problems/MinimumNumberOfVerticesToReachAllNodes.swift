class MinimumNumberOfVerticesToReachAllNodes {
    func findSmallestSetOfVertices(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var result = Set(0..<n)
        
        for edge in edges {
            result.remove(edge[1])
        }
        
        return Array(result)
    }
    
    func tests() {
        print(findSmallestSetOfVertices(6, [[0,1],[0,2],[2,5],[3,4],[4,2]])) // [0,3]
        print(findSmallestSetOfVertices(5, [[0,1],[2,1],[3,1],[1,4],[2,4]])) // [0,2,3]
    }
}

