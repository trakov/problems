class ReorderRoutesToMakeAllPathsLeadToTheCityZero {
    func minReorder(_ n: Int, _ connections: [[Int]]) -> Int {
        var visited: Set<Int> = []
        var graph: [Int: [Int]] = [:]
        
        for c in connections {
            let from = c[0], next = c[1]
            graph[from, default: []].append(next)
            graph[next, default: []].append(-from)
        }
        func dfs(_ start: Int) -> Int {
            var val = 0
            guard !visited.contains(start) else { return val }
            visited.insert(start)
            for next in graph[start]! where !visited.contains(next) {
                val += dfs(abs(next))
                if next > 0 { val += 1 }
            }
            return val
        }
        return dfs(0)
    }

    func tests() {
        print(minReorder(6, [[0,1],[1,3],[2,3],[4,0],[4,5]])) // 3
        print(minReorder(5, [[1,0],[1,2],[3,2],[3,4]])) // 2
        print(minReorder(3, [[1,0],[2,0]])) // 0
    }
}

