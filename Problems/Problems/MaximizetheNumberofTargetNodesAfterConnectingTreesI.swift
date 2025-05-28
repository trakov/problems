final class MaximizetheNumberofTargetNodesAfterConnectingTreesI {
    func maxTargetNodes(_ edges1: [[Int]], _ edges2: [[Int]], _ k: Int) -> [Int] {
        let n = edges1.count + 1
        let count1 = build(edges1, k)
        let count2 = build(edges2, k - 1)
        let maxCount2 = count2.max()!
        var res = count1
        for i in 0..<n {
            res[i] += maxCount2
        }
        return res
    }

    func build(_ edges: [[Int]], _ k: Int) -> [Int] {
        let n = edges.count + 1
        var children: [[Int]] = Array(repeating: [], count: n)
        for edge in edges {
            children[edge[0]].append(edge[1])
            children[edge[1]].append(edge[0])
        }
        var res = Array(repeating: 0, count: n)
        for i in 0..<n {
            res[i] = dfs(i, -1, children, k)
        }
        return res
    }

    func dfs(_ node: Int, _ parent: Int, _ children: [[Int]], _ k: Int) -> Int {
        guard k >= 0 else { return 0 }
        var res = 1
        for child in children[node] where child != parent {
            res += dfs(child, node, children, k - 1)
        }
        return res
    }
    
    func tests() {
        print(maxTargetNodes(
            [[0,1],[0,2],[2,3],[2,4]], [[0,1],[0,2],[0,3],[2,7],[1,4],[4,5],[4,6]], 2
        )) // [9,7,9,8,8]
        print(maxTargetNodes(
            [[0,1],[0,2],[0,3],[0,4]], [[0,1],[1,2],[2,3]], 1
        )) // [6,3,3,3,3]
    }
}
