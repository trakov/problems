class FindtheCityWiththeSmallestNumberofNeighborsataThresholdDistance {
    func findTheCity(_ n: Int, _ edges: [[Int]], _ distanceThreshold: Int) -> Int {
        var graph = Array(repeating: Array(repeating: Int.max/2, count: n), count: n)
        for edge in edges {
            graph[edge[0]][edge[1]] = edge[2]
            graph[edge[1]][edge[0]] = edge[2]
        }
        // Floyd Warshall
        for k in 0..<n {
            for i in 0..<n {
                for j in 0..<n {
                    graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j])
                }
            }
        }
        var result = 0
        var exceed = n - 1
        for i in 0..<n {
            var validCities = 0
            for j in 0..<n {
                if (i == j) {
                    continue
                }
                //calculate reachable cities
                if graph[i][j] <= distanceThreshold {
                    validCities += 1
                }
            }
            //search for valid city
            if validCities <= exceed {
                result = i
                exceed = validCities
            }
        }
        return result
    }
    
    func tests() {
        print(findTheCity(4, [[0,1,3],[1,2,1],[1,3,4],[2,3,1]], 4)) // 3
        print(findTheCity(5, [[0,1,2],[0,4,8],[1,2,3],[1,4,2],[2,3,1],[3,4,1]], 2)) // 0
    }
}

