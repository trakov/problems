class CheapestFlightsWithinKStops {
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        guard n > 0 else { return -1 }
        var parents = Array(repeating: [Int: Int](), count: n) // to -> [from: price]
        for flight in flights {
            parents[flight[1]][flight[0]] = flight[2]
        }
        var result = Int.max
        var queue = [(dst, 0)]
        var k = k
        while !queue.isEmpty && k >= 0 {
            var next: [(Int, Int)] = []
            for (cur, p) in queue {
                for (dest, price) in parents[cur] {
                    let newPrice = p + price
                    guard newPrice < result else { continue }
                    if dest == src {
                        result = newPrice
                        continue
                    }
                    next.append((dest, newPrice))
                }
            }
            queue = next
            k -= 1
        }
        return result == Int.max ? -1 : result
    }

    func findCheapestPrice2(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
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

    func tests() {
        print(findCheapestPrice(17, [[0,12,28],[5,6,39],[8,6,59],[13,15,7],[13,12,38],[10,12,35],[15,3,23],[7,11,26],[9,4,65],[10,2,38],[4,7,7],[14,15,31],[2,12,44],[8,10,34],[13,6,29],[5,14,89],[11,16,13],[7,3,46],[10,15,19],[12,4,58],[13,16,11],[16,4,76],[2,0,12],[15,0,22],[16,12,13],[7,1,29],[7,14,100],[16,1,14],[9,6,74],[11,1,73],[2,11,60],[10,11,85],[2,5,49],[3,4,17],[4,9,77],[16,3,47],[15,6,78],[14,1,90],[10,5,95],[1,11,30],[11,0,37],[10,4,86],[0,8,57],[6,14,68],[16,8,3],[13,0,65],[2,13,6],[5,13,5],[8,11,31],[6,10,20],[6,2,33],[9,1,3],[14,9,58],[12,3,19],[11,2,74],[12,14,48],[16,11,100],[3,12,38],[12,13,77],[10,9,99],[15,13,98],[15,12,71],[1,4,28],[7,0,83],[3,5,100],[8,9,14],[15,11,57],[3,6,65],[1,3,45],[14,7,74],[2,10,39],[4,8,73],[13,5,77],[10,0,43],[12,9,92],[8,2,26],[1,7,7],[9,12,10],[13,11,64],[8,13,80],[6,12,74],[9,7,35],[0,15,48],[3,7,87],[16,9,42],[5,16,64],[4,5,65],[15,14,70],[12,0,13],[16,14,52],[3,10,80],[14,11,85],[15,2,77],[4,11,19],[2,7,49],[10,7,78],[14,6,84],[13,7,50],[11,6,75],[5,10,46],[13,8,43],[9,10,49],[7,12,64],[0,10,76],[5,9,77],[8,3,28],[11,9,28],[12,16,87],[12,6,24],[9,15,94],[5,7,77],[4,10,18],[7,2,11],[9,5,41]], 13, 4, 13)) //
        print(findCheapestPrice(4, [[0,1,1],[0,2,5],[1,2,1],[2,3,1]], 0, 3, 1)) // 6
        print(findCheapestPrice(4, [[0,1,100],[1,2,100],[2,0,100],[1,3,600],[2,3,200]], 0, 3, 1)) // 700
        print(findCheapestPrice(3, [[0,1,100],[1,2,100],[0,2,500]], 0, 2, 1)) // 200
        print(findCheapestPrice(3, [[0,1,100],[1,2,100],[0,2,500]], 0, 2, 0)) // 500
    }
}
