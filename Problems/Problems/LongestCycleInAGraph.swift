class LongestCycleInAGraph {
    func longestCycle(_ edges: [Int]) -> Int {
        guard edges.count > 1 else { return -1 }
        var visited = edges
        var result = -1
        for from in 0..<visited.count - 1 {
            guard visited[from] != -1 else { continue } // no cycle or already visited
            var cycle: [Int: Int] = [from: 0] // node: index in cycle
            var to = visited[from]
            while to != -1 {
                if cycle[to] != nil {
                    result = max(result, cycle.count - cycle[to]!) // update result
                    break
                }
                cycle[to] = cycle.count
                (to, visited[to]) = (visited[to], -1)
            }
        }
        
        return result
    }
    
    func tests() {
        print(longestCycle([3,3,4,2,3])) // 3
        print(longestCycle([3,3,4,2,5,3])) // 4
        print(longestCycle([2,-1,3,1])) // -1
    }
}

