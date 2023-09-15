class MinCostToConnectAllPoints {
    func minCostConnectPoints(_ points: [[Int]]) -> Int {
        let weights = points.map { p1 in
            points.map { p2 in
                abs(p1[0] - p2[0]) + abs(p1[1] - p2[1])
            }
        }
        var p = [0]
        var g = Array(weights.indices.dropFirst())
        var result = 0
        while p.count < points.count {
            var minWeight = Int.max
            var n: Int!
            for i in p {
                for j in g.indices {
                    if weights[i][g[j]] < minWeight {
                        minWeight = weights[i][g[j]]
                        n = j
                    }
                }
            }
            result += minWeight
            p.append(g[n])
            g.remove(at: n)
        }
        return result
    }
    
    func tests() {
        print(minCostConnectPoints([[0,0],[2,2],[3,10],[5,2],[7,0]])) // 20
        print(minCostConnectPoints([[3,12],[-2,5],[-4,1]])) // 18
    }
}
