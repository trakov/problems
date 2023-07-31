class ShortestPathWithAlternatingColors {
    func shortestAlternatingPaths(_ n: Int, _ redEdges: [[Int]], _ blueEdges: [[Int]]) -> [Int] {
        var red = [[Int]](repeating: [], count: n)
        var blue = [[Int]](repeating: [], count: n)
        for edge in redEdges {
            red[edge[0]].append(edge[1])
        }
        for edge in blueEdges {
            blue[edge[0]].append(edge[1])
        }
        var res = Array(repeating: -1, count: n)
        var queue = [(0, 0, 0), (0, 1, 0)]
        var seen = Set<[Int]>()
        while !queue.isEmpty {
            let node = queue.removeFirst()
            if seen.contains([node.0, node.1]) {
                continue
            }
            seen.insert([node.0, node.1])
            if node.1 == 0 {
                for neighbor in red[node.0] {
                    queue.append((neighbor, 1, node.2 + 1))
                }
            } else {
                for neighbor in blue[node.0] {
                    queue.append((neighbor, 0, node.2 + 1))
                }
            }
            if res[node.0] == -1 {
                res[node.0] = node.2
            } else {
                res[node.0] = min(res[node.0], node.2)
            }
        }
        return res
    }
    
    func tests() {
        print(shortestAlternatingPaths(3, [[0,1],[1,2]], [])) // [0,1,-1]
        print(shortestAlternatingPaths(3, [[0,1]], [[2,1]])) // [0,1,-1]
    }
}
