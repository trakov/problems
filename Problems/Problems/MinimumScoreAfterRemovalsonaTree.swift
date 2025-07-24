final class MinimumScoreAfterRemovalsonaTree {
    private typealias Edge = (from: Int, to: Int)
    func minimumScore(_ nums: [Int], _ edges: [[Int]]) -> Int {
        let n = nums.count
        var tree = Array(repeating: [Int](), count: n)
        for e in edges {
            tree[e[0]].append(e[1])
            tree[e[1]].append(e[0])
        }
        let root = 0
        var xorSum = Array(repeating: 0, count:n )
        var subTrees = Array(repeating: Set<Int>(), count: n)
        var level = Array(repeating: -1, count: n)
        func dfs(_ parent: Int, _ node: Int, _ curLel: Int) {
            xorSum[node] = nums[node]
            subTrees[node].insert(node)
            level[node] = curLel
            for next in tree[node] {
                guard next != parent else {
                    continue
                }
                dfs(node, next, curLel + 1)
                xorSum[node] ^= xorSum[next]
                subTrees[node] = subTrees[node].union(subTrees[next])
            }
        }
        dfs(-1, root,0)
        let sortedDirectedEdges: [Edge] = edges.map { e in
            if level[e[0]] < level[e[1]] {
                return (e[0],e[1])
            } else {
                return (e[1],e[0])
            }
        }.sorted { e1, e2 in
            level[e1.from] < level[e2.from]
        }
        var ans = Int.max
        let M = edges.count
        for i in 0..<M {
            var j = i + 1
            while j < M {
                let fe = sortedDirectedEdges[i]
                let se = sortedDirectedEdges[j]
                let nodes = [fe.from,fe.to,se.from,se.to]
                var (f,s,t) = (0,0,0)
                if subTrees[nodes[1]].contains(nodes[2]) {
                    (f,s,t) = (xorSum[root] ^ xorSum[nodes[1]],xorSum[nodes[1]] ^ xorSum[nodes[3]],xorSum[nodes[3]])
                } else {
                    (f,s,t) = (xorSum[root] ^ xorSum[nodes[1]] ^ xorSum[nodes[3]],xorSum[nodes[1]],xorSum[nodes[3]])
                }
                ans = min(ans, max(f,s,t) - min(f,s,t))
                j += 1
            }
        }
        return ans
    }
    
    func tests() {
        print(minimumScore([1,5,5,4,11], [[0,1],[1,2],[1,3],[3,4]])) // 9
        print(minimumScore([5,5,2,4,4,2], [[0,1],[1,2],[5,2],[4,3],[1,3]])) // 0
    }
}
