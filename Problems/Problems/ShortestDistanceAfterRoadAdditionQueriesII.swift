class ShortestDistanceAfterRoadAdditionQueriesII {
    func shortestDistanceAfterQueries(_ n: Int, _ queries: [[Int]]) -> [Int] {
        var result = Array(repeating: n-1, count: queries.count)
        var map: [Int: Int] = [:]
        for i in 0..<n-1 {
            map[i] = i + 1
        }
        for (i, q) in queries.enumerated() {
            var u = q[0]
            var v = q[1]
            guard var j = map[u], j < v else {
                result[i] = map.count
                continue
            }
            while j < v {
                j = map.removeValue(forKey: j)!
            }
            map[u] = v
            result[i] = map.count
        }
        return result
    }
    
    func tests() {
        print(shortestDistanceAfterQueries(5, [[2,4],[0,2],[0,4]])) // [3,2,1]
        print(shortestDistanceAfterQueries(4, [[0,3],[0,2]])) // [1,1]
    }
}

