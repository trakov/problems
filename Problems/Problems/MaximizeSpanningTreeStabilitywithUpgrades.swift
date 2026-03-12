final class MaximizeSpanningTreeStabilitywithUpgrades {
    class DSU {
        var parent: [Int]
        init(_ parent: [Int]) {
            self.parent = parent
        }
        func find(_ x: Int) -> Int {
            if parent[x] != x {
                parent[x] = find(parent[x])
            }
            return parent[x]
        }

        func join(_ x: Int, _ y: Int) {
            let px = find(x)
            let py = find(y)
            parent[px] = py
        }
    }

    func maxStability(_ n: Int, _ edges: [[Int]], _ k: Int) -> Int {
        let MAX_STABILITY = 200_000
        var result = -1
        if edges.count < n - 1 {
            return -1
        }
        var mustEdges: [[Int]] = []
        var optionalEdges: [[Int]] = []
        for edge in edges {
            if edge[3] == 1 {
                mustEdges.append(edge)
            } else {
                optionalEdges.append(edge)
            }
        }
        if mustEdges.count > n - 1 {
            return -1
        }
        optionalEdges.sort { $1[2] < $0[2] }
        var selectedInit = 0
        var mustMinStability = MAX_STABILITY
        let dsuInit = DSU(Array(0..<n))
        for e in mustEdges {
            let (u, v, s) = (e[0], e[1], e[2])
            if dsuInit.find(u) == dsuInit.find(v) || selectedInit == n - 1 {
                return -1
            }
            dsuInit.join(u, v)
            selectedInit += 1
            mustMinStability = min(mustMinStability, s)
        }
        var l = 0
        var r = mustMinStability
        while l < r {
            let mid = l + (r - l + 1) / 2
            let dsu = DSU(dsuInit.parent)
            var selected = selectedInit
            var doubledCount = 0
            for e in optionalEdges {
                let (u, v, s) = (e[0], e[1], e[2])
                if dsu.find(u) == dsu.find(v) {
                    continue
                }
                if s >= mid {
                    dsu.join(u, v)
                    selected += 1
                } else if doubledCount < k && s * 2 >= mid {
                    doubledCount += 1
                    dsu.join(u, v)
                    selected += 1
                } else {
                    break
                }
                if selected == n - 1 {
                    break
                }
            }
            if selected != n - 1 {
                r = mid - 1
            } else {
                l = mid
                result = mid
            }
        }
        return result
    }
    
    func tests() {
        print(maxStability(3, [[0,1,2,1],[1,2,3,0]], 1)) // 2
        print(maxStability(3, [[0,1,4,0],[1,2,3,0],[0,2,1,0]], 2)) // 6
        print(maxStability(3, [[0,1,1,1],[1,2,1,1],[2,0,1,1]], 0)) // -1
    }
}
