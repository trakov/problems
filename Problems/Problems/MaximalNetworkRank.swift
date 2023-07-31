class MaximalNetworkRank {
    func maximalNetworkRank(_ n: Int, _ roads: [[Int]]) -> Int {
        var graph = Array(repeating: Set<Int>(), count: n)
        for road in roads {
            graph[road[0]].insert(road[1])
            graph[road[1]].insert(road[0])
        }
        var result = 0
        for i in 0..<n-1 {
            let a = graph[i].count
            for j in i+1..<n {
                let b = graph[j].count
                result = max(result, a + b - (graph[i].contains(j) ? 1 : 0))
            }
        }
        return result
    }
    
    func tests() {
        print(maximalNetworkRank(4, [[0,1],[0,3],[1,2],[1,3]])) // 4
        print(maximalNetworkRank(5, [[0,1],[0,3],[1,2],[1,3],[2,3],[2,4]])) // 5
        print(maximalNetworkRank(8, [[0,1],[1,2],[2,3],[2,4],[5,6],[5,7]])) // 5
    }
}

