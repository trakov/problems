import HeapModule

final class NetworkRecoveryPathways {
    private struct State: Comparable {
        let dist: Int
        let node: Int
        init(_ dist: Int, _ node: Int) {
            self.dist = dist
            self.node = node
        }
        static func < (lhs: State, rhs: State) -> Bool {
            lhs.dist < rhs.dist
        }
    }
    
    func findMaxPathScore(_ edges: [[Int]], _ online: [Bool], _ k: Int) -> Int {
        let n = online.count
        var graph = Array(repeating: [(to: Int, weight: Int)](), count: n)
        var left = Int.max
        var right = 0
        for edge in edges {
            let u = edge[0]
            let v = edge[1]
            let w = edge[2]
            guard online[u], online[v] else { continue }
            graph[u].append((to: v, weight: w))
            left = min(left, w)
            right = max(right, w)
        }
        if !check(graph, left, k, n) { return -1 }
        var l = left
        var r = right
        while l <= r {
            let mid = (l + r) >> 1
            if check(graph, mid, k, n) {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        return r
    }

    private func check(_ graph: [[(to: Int, weight: Int)]], _ minWeight: Int, _ limit: Int, _ n: Int) -> Bool {
        var distance = Array(repeating: Int.max, count: n)
        distance[0] = 0
        var heap = HeapModule.Heap<State>()
        heap.insert(State(0, 0))
        while let state = heap.popMin() {
            if state.dist > limit { return false }
            if state.node == n - 1 { return true }
            if state.dist > distance[state.node] { continue }
            for edge in graph[state.node] {
                guard edge.weight >= minWeight else { continue }
                let newDist = state.dist + edge.weight
                if newDist < distance[edge.to] {
                    distance[edge.to] = newDist
                    heap.insert(State(newDist, edge.to))
                }
            }
        }
        return false
    }

    func tests() {
        print(findMaxPathScore(
            [[0,1,5],[1,3,10],[0,2,3],[2,3,4]], [true,true,true,true], 10
        )) // 3
        print(findMaxPathScore(
            [[0,1,7],[1,4,5],[0,2,6],[2,3,6],[3,4,2],[2,4,6]], [true,true,true,false,true], 12
        )) // 6
    }
}
