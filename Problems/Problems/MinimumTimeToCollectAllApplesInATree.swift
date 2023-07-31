class MinimumTimeToCollectAllApplesInATree {
    func minTime(_ n: Int, _ edges: [[Int]], _ hasApple: [Bool]) -> Int {
        var graph: [[Int]] = Array(repeating: [], count: n)

        for edge in edges {
            graph[edge[0]].append(edge[1])
            graph[edge[1]].append(edge[0])
        }

        func dfs(_ node: Int, _ parent: Int) -> Int {
            var result = 0
            
            for child in graph[node] {
                if child == parent { continue }
                
                let time = dfs(child, node)
                
                if time > 0 || hasApple[child] {
                    result += 2 + time
                }
            }
            return result
        }
        
        return dfs(0, -1)
    }
    
    func tests() {
        print(minTime(4, [[0,2],[0,3],[1,2]], [false,true,false,false])) // 4
        
        print(minTime(7, [[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]], [false,false,true,false,true,true,false])) // 8
        print(minTime(7, [[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]], [false,false,true,false,false,true,false])) // 6
        print(minTime(7, [[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]], [false,false,false,false,false,false,false])) // 0
    }
}
