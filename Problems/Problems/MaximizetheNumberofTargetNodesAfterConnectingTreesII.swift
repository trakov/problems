final class MaximizetheNumberofTargetNodesAfterConnectingTreesII {
    func maxTargetNodes(_ edges1: [[Int]], _ edges2: [[Int]]) -> [Int] {
        let (n, m) = (edges1.count + 1, edges2.count + 1)
        var color1 = Array(repeating: 0, count: n)
        var color2 = Array(repeating: 0, count: m)
        let count1 = build(edges1, &color1)
        let count2 = build(edges2, &color2)
        var res = Array(repeating: 0, count: n)
        for (i, c) in color1.enumerated() {
            res[i] += count1[c] + max(count2[0], count2[1])
        }
        return res
    }

    func build(_ edges: [[Int]], _ color: inout [Int]) -> [Int] {
        let n = edges.count + 1
        var children: [[Int]] = Array(repeating: [], count: n)
        for edge in edges {
            children[edge[0]].append(edge[1])
            children[edge[1]].append(edge[0])
        }
        let res = dfs(0, -1, 0, children, &color)
        return [res, n - res]
    }

    func dfs(_ node: Int, _ parent: Int, _ depth: Int, _ children: [[Int]], _ color: inout [Int]) -> Int {
        var res = 1 - depth % 2
        color[node] = depth % 2
        for child in children[node] where child != parent {
            res += dfs(child, node, depth + 1, children, &color)
        }
        return res
    }

    func tests() {
        print(maxTargetNodes(
            [[0,1],[0,2],[2,3],[2,4]], [[0,1],[0,2],[0,3],[2,7],[1,4],[4,5],[4,6]]
        )) // [8,7,7,8,8]
        print(maxTargetNodes(
            [[0,1],[0,2],[0,3],[0,4]], [[0,1],[1,2],[2,3]]
        )) // [3,6,6,6,6]
    }
}
