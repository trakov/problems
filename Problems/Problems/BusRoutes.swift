class BusRoutes {
    func numBusesToDestination(_ routes: [[Int]], _ source: Int, _ target: Int) -> Int {
        guard source != target else { return 0 }
        var stationBuses: [Int: [Int]] = [:]
        for (i, route) in routes.enumerated() {
            for station in route {
                stationBuses[station, default: []].append(i)
            }
        }
        var startBuses = stationBuses[source] ?? []
        let endBuses = stationBuses[target] ?? []
        guard Set(startBuses).intersection(Set(endBuses)).isEmpty else { return 1 }
        guard !startBuses.isEmpty && !endBuses.isEmpty else { return -1 }
        var connectedBuses: [Set<Int>] = Array(repeating: [], count: routes.count)
        
        for (_, buses) in stationBuses {
            for (i, bus) in buses.enumerated() {
                var busesToUnion: [Int] = []
                if i == 0 {
                    busesToUnion = Array(buses[1..<buses.count])
                } else if i == buses.count - 1 {
                    busesToUnion = Array(buses[0..<buses.count-1])
                } else {
                    busesToUnion = Array(buses[0..<i] + buses[i+1..<buses.count])
                }
                connectedBuses[bus].formUnion(busesToUnion)
            }
        }
        var result = 1
        var visited: Set<Int> = []
        while !startBuses.isEmpty {
            result += 1
            let size = startBuses.count
            for bus in startBuses {
                for b in connectedBuses[bus] {
                    if endBuses.contains(b) {
                        return result
                    }
                    if visited.insert(b).inserted {
                        startBuses.append(b)
                    }
                }
            }
            startBuses.removeFirst(size)
        }
        
        return -1
    }
    
    func numBusesToDestination2(_ routes: [[Int]], _ source: Int, _ target: Int) -> Int {
        guard source != target else { return 0 }
        var result = Int.max
        var stationBuses: [Int: [Int]] = [:]
        for (i, route) in routes.enumerated() {
            for station in route {
                stationBuses[station, default: []].append(i)
            }
        }
        let startBuses = stationBuses[source] ?? []
        let endBuses = stationBuses[target] ?? []

        guard Set(startBuses).intersection(Set(endBuses)).isEmpty else { return 1 }
        guard !startBuses.isEmpty && !endBuses.isEmpty else { return -1 }
        
        func dfs(bus: Int, visitedBuses: inout [Int]) -> Int {
            for station in routes[bus] {
                for newBus in stationBuses[station] ?? [] {
                    if visitedBuses.contains(newBus) { continue }
                    visitedBuses.append(newBus)
                    if endBuses.contains(newBus) {
                        result = min(result, visitedBuses.count)
                    }
                    return dfs(bus: newBus, visitedBuses: &visitedBuses)
                }
            }
            return Int.max
        }
        
        for bus in startBuses {
            var visitedBuses = [bus]
            result = min(result, dfs(bus: bus, visitedBuses: &visitedBuses))
            visitedBuses = []
        }
        
        
        return result == Int.max ? -1 : result
    }

    func tests() {
        print(numBusesToDestination([
            [0,1,6,16,22,23],
            [14,15,24,32],
            [4,10,12,20,24,28,33],
            [1,10,11,19,27,33],
            [11,23,25,28],
            [15,20,21,23,29],
            [29]
        ], 4, 21)) // 2
        print(numBusesToDestination([[1,2,7],[3,6,7]], 1, 6)) // 2
        print(numBusesToDestination([[7,12],[4,5,15],[6],[15,19],[9,12,13]], 15, 12)) // -1
    }
}
