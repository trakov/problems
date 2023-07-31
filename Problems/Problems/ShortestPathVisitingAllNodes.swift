class ShortestPathVisitingAllNodes {
    func shortestPathLength(_ graph: [[Int]]) -> Int {
        guard graph.count > 1 else { return 0 }
        let finalState = 1 << graph.count - 1
        var queue = (0..<graph.count).map { ($0, 1 << $0) }
        var visited = queue.map { Set([$0.1]) }
        var result = 0
        while !queue.isEmpty {
            result += 1
            var nextQueue: [(Int, Int)] = []
            for (i, state) in queue {
                for next in graph[i] {
                    let newState = state | (1 << next)
                    guard newState != finalState else { return result }
                    guard !visited[next].contains(newState) else { continue }
                    visited[next].insert(newState)
                    nextQueue.append((next, newState))
                }
            }
            queue = nextQueue
        }
        return -1
    }

    func shortestPathLength2(_ graph: [[Int]]) -> Int {
        struct State: Hashable {
            let node: Int, vzit: UInt16
        }
        
        let len = graph.count, one: UInt16 = 1, total = one << len - 1
        
        var queue: [State] = [], setVzit: Set<State> = []
        
        for n in 0..<len {
            let state = State(node: n, vzit: one << n)
            queue.append(state)
            setVzit.insert(state)
        }
        
        var level = 0
        
        while !queue.isEmpty {
            level += 1
            var nextLvl: [State] = []
            for state in queue {
                for n in graph[state.node] {
                    let visit: UInt16 = state.vzit | (one << n)
                    guard visit != total else { return level }
                    let next = State(node: n, vzit: visit)
                    guard !(setVzit.contains(next)) else { continue }
                    setVzit.insert(next)
                    nextLvl.append(next)
                }
            }
            queue = nextLvl
        }
        return 0
    }
    
    func tests() {
        print(shortestPathLength([[1,2,3,4,5,6,7,8,9],[0,2,3,4,5,6,7,8,9],[0,1,3,4,5,6,7,8,9],[0,1,2,4,5,6,7,8,9],[0,1,2,3,5,6,7,8,9],[0,1,2,3,4,6,7,8,9],[0,1,2,3,4,5,7,8,9],[0,1,2,3,4,5,6,8,9],[0,1,2,3,4,5,6,7,9,10],[0,1,2,3,4,5,6,7,8,11],[8],[9]]))
        print(shortestPathLength([[1,2,3],[0],[0],[0]])) // 4
        print(shortestPathLength([[1],[0,2,4],[1,3,4],[2],[1,2]])) // 4
    }
}

