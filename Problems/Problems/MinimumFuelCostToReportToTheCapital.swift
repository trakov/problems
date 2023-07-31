import Foundation
class MinimumFuelCostToReportToTheCapital {
    func minimumFuelCost(_ roads: [[Int]], _ seats: Int) -> Int {
        guard roads.count > 0 else { return 0 }
        var graph: [Int: [Int]] = [:]
        for road in roads {
            graph[road[0], default: []].append(road[1])
            graph[road[1], default: []].append(road[0])
        }

        var result: Double = 0

        func dfs(_ node: Int, _ prev: Int, _ graph: [Int: [Int]], _ seats: Double) -> Double {
            var people: Double = 1

            for neighbor in graph[node]! {
                if neighbor == prev {
                    continue
                }
                people += dfs(neighbor, node, graph, seats)
            }
            if node > 0 {
                result += ceil(people / seats)
            }
            
            return people
        }

        dfs(0, -1, graph, Double(seats))
        return Int(result)
    }
    
    func tests() {
//        print(minimumFuelCost([[0,1],[0,2],[0,3]], 5)) // 3
//        print(minimumFuelCost([[3,1],[3,2],[1,0],[0,4],[0,5],[4,6]], 2)) // 7
        print(minimumFuelCost([], 1)) // 0
    }
}
