import HeapModule

class NumberofWaystoArriveatDestination {
    struct NodeTime: Comparable {
        let node: Int
        let time: Int
        static func < (lhs: NodeTime, rhs: NodeTime) -> Bool { lhs.time < rhs.time }
    }
    func countPaths(_ n: Int, _ roads: [[Int]]) -> Int {
        let MOD = 1_000_000_007
        var graph: [[NodeTime]] = Array(repeating: [], count: n)
        for road in roads {
            let (start, end, time) = (road[0], road[1], road[2])
            graph[start].append(NodeTime(node: end, time: time))
            graph[end].append(NodeTime(node: start, time: time))
        }
        var minHeap = HeapModule.Heap<NodeTime>()
        var shortestTime = Array(repeating: Int.max, count: n)
        var pathCount = Array(repeating: 0, count: n)
        shortestTime[0] = 0
        pathCount[0] = 1
        minHeap.insert(NodeTime(node: 0, time: 0))
        while !minHeap.isEmpty {
            let curr = minHeap.removeMin()
            if curr.time > shortestTime[curr.node] {
                continue
            }
            for neighbor in graph[curr.node] {
                if curr.time + neighbor.time < shortestTime[neighbor.node] {
                    shortestTime[neighbor.node] = curr.time + neighbor.time
                    pathCount[neighbor.node] = pathCount[curr.node]
                    minHeap.insert(NodeTime(
                        node: neighbor.node, time: shortestTime[neighbor.node]
                    ))
                } else if curr.time + neighbor.time == shortestTime[neighbor.node] {
                    pathCount[neighbor.node] = (pathCount[neighbor.node] + pathCount[curr.node]) % MOD
                }
            }
        }
        return pathCount[n - 1]
    }
    
    func tests() {
        print(countPaths(
            7,
            [[0,6,7],[0,1,2],[1,2,3],[1,3,3],[6,3,3],[3,5,1],[6,5,1],[2,5,1],[0,4,5],[4,6,2]]
        )) // 4
        print(countPaths(2, [[1,0,10]])) // 1
    }
}

