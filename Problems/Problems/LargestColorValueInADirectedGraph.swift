class LargestColorValueInADirectedGraph {
    func largestPathValue(_ colors: String, _ edges: [[Int]]) -> Int {
        var map: [Int: [Int]] = [:]
        var inDegrees = Array(repeating: 0, count: colors.count)
        for edge in edges {
            map[edge[0], default:[]].append(edge[1])
            inDegrees[edge[1]] += 1
        }
        let colors = Array(colors)
        var freqMap = Array(repeating: [Character: Int](), count: colors.count)
        var unvisited = Set(colors.indices)
        var queue = colors.indices.filter { inDegrees[$0] == 0 }
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            unvisited.remove(node)
            freqMap[node][colors[node], default: 0] += 1
            
            for adj in map[node, default: []] {
                inDegrees[adj] -= 1
                if inDegrees[adj] == 0 { queue.append(adj) }
                freqMap[adj].merge(freqMap[node], uniquingKeysWith: max)
            }
        }
        
        return unvisited.isEmpty ? freqMap.reduce(0) {max($0, $1.values.max()!)} : -1
    }
    
    func tests() {
        print(largestPathValue("abaca", [[0,1],[0,2],[2,3],[3,4]])) // 3
        print(largestPathValue("a", [[0,0]])) // -1
    }
}

