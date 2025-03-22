class CounttheNumberofCompleteComponents {
    func countCompleteComponents(_ n: Int, _ edges: [[Int]]) -> Int {
        var parent = Array(0..<n)
        var rank = Array(repeating: 0, count: n)

        func find(_ x: Int) -> Int {
            if parent[x] != x {
                parent[x] = find(parent[x])
            }
            return parent[x]
        }

        func union(_ x: Int, _ y: Int) {
            let rootX = find(x)
            let rootY = find(y)
            if rootX == rootY { return }

            if rank[rootX] < rank[rootY] {
                parent[rootX] = rootY
            } else if rank[rootX] > rank[rootY] {
                parent[rootY] = rootX
            } else {
                parent[rootY] = rootX
                rank[rootX] += 1
            }
        }

        for edge in edges {
            union(edge[0], edge[1])
        }

        var componentVertices: [Int: Set<Int>] = [:]
        var componentEdges: [Int: Int] = [:]

        for i in 0..<n {
            let root = find(i)
            componentVertices[root, default: []].insert(i)
        }

        for edge in edges {
            let root = find(edge[0])
            componentEdges[root, default: 0] += 1
        }

        var completeCount = 0
        for (root, vertices) in componentVertices {
            let numVertices = vertices.count
            let expectedEdges = numVertices * (numVertices - 1) / 2

            if componentEdges[root, default: 0] == expectedEdges {
                completeCount += 1
            }
        }

        return completeCount
    }
    
    func tests() {
        print(countCompleteComponents(6, [[0,1],[0,2],[1,2],[3,4]])) // 3
        print(countCompleteComponents(6, [[0,1],[0,2],[1,2],[3,4],[3,5]])) // 1
    }
}

