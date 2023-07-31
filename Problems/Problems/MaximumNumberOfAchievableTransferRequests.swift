class MaximumNumberOfAchievableTransferRequests {
    func maximumRequests(_ n: Int, _ requests: [[Int]]) -> Int {
        var degree = Array(repeating: 0, count: n)
        func dfs(_ i: Int) -> Int {
            guard i != requests.count else {
                return degree.filter{ $0 == 0 }.count == n ? 0 : .min
            }
            degree[requests[i][0]] -= 1
            degree[requests[i][1]] += 1
            let take = 1 + dfs(i + 1)
            degree[requests[i][0]] += 1
            degree[requests[i][1]] -= 1
            return max(take,  dfs(i + 1))
        }
        return dfs(0)
    }

    func maximumRequests2_failed(_ n: Int, _ requests: [[Int]]) -> Int {
        var map: [Int: [Int: Int]] = [:]
        var result = 0
        for request in requests {
            if request[0] == request[1] {
                result += 1
            } else {
                map[request[0], default: [:]][request[1], default: 0] += 1
            }
        }
        var changed = true
        while changed {
            changed = false
            for (source, dests) in map {
                for dest in dests.keys where map[dest] == nil {
                    changed = true
                    map[source]?[dest] = nil
                    guard map[source]?.isEmpty ?? true else { continue }
                    map[source] = nil
                }
            }
        }
        var paths: [Int: [Int]]
        
        
        return result
    }
    
    func tests() {
        print(maximumRequests(5, [[0,1],[1,0],[0,1],[1,2],[2,0],[3,4]])) // 5
        print(maximumRequests(3, [[0,0],[1,2],[2,1]])) // 3
        print(maximumRequests(4, [[0,3],[3,1],[1,2],[2,0]])) // 4
    }
}

