class NumberOfGoodPaths {
    func numberOfGoodPaths(_ vals: [Int], _ edges: [[Int]]) -> Int {
        let n = vals.count
        if n < 2 { return n }
        let sortedEdges = edges.map { e in [e[0], e[1], max(vals[e[0]], vals[e[1]])]}.sorted { $0[2] < $1[2] }
        var parents = (0 ..< n).map { $0 }
        var counts = vals.map { (val: $0, count: 1) }
        var result = 0
        for e in sortedEdges {
            let val = e[2]
            let p0 = searchParent(e[0], &parents)
            let p1 = searchParent(e[1], &parents)
            let c0 = counts[p0]
            let c1 = counts[p1]
            if c0.val == c1.val {
                result += c0.count * c1.count
            }
            let count = ((c0.val == val) ? c0.count : 0) + ((c1.val == val) ? c1.count : 0)
            parents[p1] = p0
            counts[p0] = (val, count)
        }
        return result + n
    }

    private func searchParent(_ e: Int, _ parents: inout [Int]) -> Int {
        if parents[e] == e { return e }
        parents[e] = searchParent(parents[e], &parents)
        return parents[e]
    }

    func tests() {
        
    }
}
