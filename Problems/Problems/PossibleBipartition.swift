class PossibleBipartition {
    func possibleBipartition(_ n: Int, _ dislikes: [[Int]]) -> Bool {
        guard !dislikes.isEmpty else { return true }
        let graph = dislikes.reduce(into: [Int: [Int]]()) { graph, edge in
            graph[edge[0], default:[]].append(edge[1])
            graph[edge[1], default:[]].append(edge[0])
        }
        var color = Array(repeating: -1, count: n + 1)
        for i in 1...n where color[i] == -1 {
            color[i] = 0
            var queue = [i]
            while let node = queue.popLast(), let neighbors = graph[node] {
                for neighbor in neighbors {
                    if color[node] == color[neighbor] {
                        return false
                    } else if color[neighbor] == -1 {
                        color[neighbor] = 1 - color[node]
                        queue.append(neighbor)
                    }
                }
            }
        }
        return true
    }

    func tests() {
        print(possibleBipartition(10, [[4,7],[4,8],[5,6],[1,6],[3,7],[2,5],[5,8],[1,2],[4,9],[6,10],[8,10],[3,6],[2,10],[9,10],[3,9],[2,3],[1,9],[4,6],[5,7],[3,8],[1,8],[1,7],[2,4]])) // true
        print(possibleBipartition(4, [[1,2],[1,3],[2,4]])) // true
        print(possibleBipartition(3, [[1,2],[1,3],[2,3]])) // false
        print(possibleBipartition(5, [[1,2],[2,3],[3,4],[4,5],[1,5]])) // false
    }
}
