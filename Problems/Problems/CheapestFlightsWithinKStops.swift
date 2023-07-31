class CheapestFlightsWithinKStops {
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        let graph = flights.reduce(into: [Int: [(Int, cost: Int)]]()) { graph, weightedEdge in
            graph[weightedEdge[1], default:.init()].append((weightedEdge[0], weightedEdge[2]))
        }
        var result = Int.max
        var stops = 0
        var queue = [(dst, 0)]
        while !queue.isEmpty && stops <= k {
            queue = queue.flatMap { cur in
                (graph[cur.0] ?? []).compactMap { next in
                    let newCost = cur.1 + next.1
                    guard newCost < result else { return nil }
                    if next.0 == src {
                        result = min(result, newCost)
                        return nil
                    }
                    return (next.0, newCost)
                }
            }
            stops += 1
        }
        return result == Int.max ? -1 : result
    }

    func findCheapestPrice2(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        var map: [Int: [(to: Int, price: Int)]] = [:]
        for flight in flights {
            map[flight[0], default: []].append((flight[1], flight[2]))
        }
        var visited = Array(repeating: [Int: Int](), count: n) // number of stops and price
        visited[src] = [-1:0]
        var queue = [src]
        var i = 0
        while !queue.isEmpty && i <= k {
            let count = queue.count
            for city in queue {
                let cityInfo = visited[city] // dict with [stops:price]
                for (to, price) in map[city]! {
                    
                }
            }
            queue.removeFirst(count)
            i += 1
        }
        
        return visited[dst].sorted { dst1, dst2 in
            dst1.value < dst2.value
        }.first?.value ?? -1
    }

    func tests() {
        print(findCheapestPrice(4, [[0,1,100],[1,2,100],[2,0,100],[1,3,600],[2,3,200]], 0, 3, 1)) // 700
        print(findCheapestPrice(3, [[0,1,100],[1,2,100],[0,2,500]], 0, 2, 1)) // 200
        print(findCheapestPrice(3, [[0,1,100],[1,2,100],[0,2,500]], 0, 2, 0)) // 500
    }
}
