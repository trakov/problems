class MaximalNetworkRank {
    func maximalNetworkRank2(_ n: Int, _ roads: [[Int]]) -> Int {
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
    
    func maximalNetworkRank(_ n: Int, _ roads: [[Int]]) -> Int {
        var graph = Array(repeating: Set<Int>(), count: n)
        for road in roads {
            graph[road[0]].insert(road[1])
            graph[road[1]].insert(road[0])
        }
        var buckets = Array(repeating: [Int](), count: n)
        for (city, dests) in graph.enumerated() {
            buckets[dests.count].append(city)
        }
        var result = 0
        
        func isAllConnected<T: Collection>(cities: T, to city: Int) -> Bool where T.Element == Int {
            for c in cities {
                if !graph[c].contains(city) {
                    return false
                }
            }
            return true
        }
        
        func isAllConnected(cities: [Int]) -> Bool {
            let n = cities.count
            for i in 0..<n - 1 {
                let city = cities[i]
                if !isAllConnected(cities: cities[i+1..<n], to: city) {
                    return false
                }
            }
            return true
        }
        
        var firstCity: Int?
        for i in (0..<n).reversed() where !buckets[i].isEmpty {
            let bucket = buckets[i]
            if result == 0 {
                if bucket.count == 1 {
                    firstCity = bucket[0]
                    result = i
                } else {
                    result = 2 * i
                    if isAllConnected(cities: bucket) {
                        result -= 1
                    }
                    return result
                }
            } else {
                result += i
                if isAllConnected(cities: bucket, to: firstCity!) {
                    result -= 1
                }
                return result
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

