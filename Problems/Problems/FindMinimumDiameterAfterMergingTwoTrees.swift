class FindMinimumDiameterAfterMergingTwoTrees {
    func minimumDiameterAfterMerge(_ edges1: [[Int]], _ edges2: [[Int]]) -> Int {
        func diameter(_ edges: [[Int]]) -> Int {
            let edges = edges.reduce(into: Array(repeating: [Int](), count: edges.count + 1)) {
                $0[$1[0]].append($1[1])
                $0[$1[1]].append($1[0])
            }
            var counts = edges.map(\.count)
            var left = edges.count
            var res = 0
            var leafs = counts.indices.filter { counts[$0] == 1 }
            while left > 1 {
                var newleafs = [Int]()
                res += 1
                for l in leafs {
                    counts[l] -= 1
                    left -= 1
                    for j in edges[l] {
                        counts[j] -= 1
                        if counts[j] == 1 { newleafs.append(j) }
                    }
                }
                leafs = newleafs
            }
            res *= 2
            if left == 0 { res -= 1 }
            return res
        }
        let d1 = diameter(edges1)
        let d2 = diameter(edges2)
        return max(max(d1, d2), (d1 + 1) / 2 + (d2 + 1) / 2 + 1)
    }
    
    func tests() {
        print(minimumDiameterAfterMerge(
            [[0,1],[0,2],[0,3]],
            [[0,1]]
        )) // 3
        print(minimumDiameterAfterMerge(
            [[0,1],[0,2],[0,3],[2,4],[2,5],[3,6],[2,7]],
            [[0,1],[0,2],[0,3],[2,4],[2,5],[3,6],[2,7]]
        )) // 5
    }
}

