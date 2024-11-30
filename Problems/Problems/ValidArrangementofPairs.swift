class ValidArrangementofPairs {
    func validArrangement(_ pairs: [[Int]]) -> [[Int]] {
        var adjList: [Int: [Int]] = [:]
        var inDegree: [Int: Int] = [:]
        for pair in pairs {
            adjList[pair[0], default: []].append(pair[1])
            inDegree[pair[1], default: 0] += 1
        }
        var start = pairs[0][0]
        for (v, outEdges) in adjList {
            if outEdges.count - inDegree[v, default:0] == 1 {
                start = v; break
            }
        }
        var path: [[Int]] = []
        func traverse(from vertex: Int) {
            while let next = adjList[vertex]?.popLast() {
                traverse(from: next)
                path.append([vertex, next])
            }
        }
        traverse(from: start)
        path.reverse()
        return path
    }
    
    func tests() {
        print(validArrangement([[5,1],[4,5],[11,9],[9,4]])) // [[11,9],[9,4],[4,5],[5,1]]
        print(validArrangement([[1,3],[3,2],[2,1]])) // [[1,3],[3,2],[2,1]]
        print(validArrangement([[1,2],[1,3],[2,1]])) // [[1,2],[2,1],[1,3]]
    }
}

