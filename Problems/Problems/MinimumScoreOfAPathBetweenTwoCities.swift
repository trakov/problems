class MinimumScoreOfAPathBetweenTwoCities {
    func minScore(_ n: Int, _ roads: [[Int]]) -> Int {
        var visited: Set<Int> = []
        var result = Int.max
        var graph: [Int: [(Int, Int)]] = [:]
        for road in roads {
            graph[road[0], default: []].append((road[1], road[2]))
            graph[road[1], default: []].append((road[0], road[2]))
        }
        
        var queue = [1]
        
        while !queue.isEmpty {
            var nextQueue: [Int] = []
            for city in queue {
                for dest in graph[city] ?? [] {
                    result = min(result, dest.1)
                    guard !visited.contains(dest.0) else { continue }
                    visited.insert(dest.0)
                    nextQueue.append(dest.0)
                }
            }
            queue = nextQueue
        }
        
        return result
    }
    
    func tests() {
        print(minScore(4, [[1,2,9],[2,3,6],[2,4,5],[1,4,7]])) // 5
        print(minScore(4, [[1,2,2],[1,3,4],[3,4,7]])) // 2
    }
}

