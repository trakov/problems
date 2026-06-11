final class NumberofWaystoAssignEdgeWeightsI {
    func qpow(_ x: Int, _ y: Int) -> Int {
        let MOD = 1_000_000_007
        var y = y
        var res = 1
        var base = x
        while y > 0 {
            if (y & 1) == 1 {
                res = (res * base) % MOD
            }
            base = (base * base) % MOD
            y >>= 1
        }
        return res
    }

    func assignEdgeWeights(_ edges: [[Int]]) -> Int {
        let n = edges.count + 1
        var g: [[Int]] = Array(repeating: [Int](), count: n + 1)
        for e in edges {
            let (u, v) = (e[0], e[1])
            g[u].append(v)
            g[v].append(u)
        }
        func dfs(_ x: Int, _ f: Int) -> Int {
            var maxDep = 0
            for y in g[x] where y != f {
                maxDep = max(maxDep, dfs(y, x) + 1)
            }
            return maxDep
        }
        let maxDep = dfs(1, 0)
        return qpow(2, maxDep - 1)
    }
    
    func tests() {
        print(assignEdgeWeights([[1,2]])) // 1
        print(assignEdgeWeights([[1,2],[1,3],[3,4],[3,5]])) // 2
    }
}
