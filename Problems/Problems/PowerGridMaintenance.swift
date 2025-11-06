final class PowerGridMaintenance {
    func processQueries(_ c: Int, _ connections: [[Int]], _ queries: [[Int]]) -> [Int] {
        var groups = Array(0...c)
        
        @discardableResult func find(_ x:Int) -> Int {
            if groups[x] != x { groups[x] = find(groups[x]) }
            return groups[x]
        }
        
        for c in connections { groups[find(c[0])] = find(c[1]) }
        for i in 1...c { find(i) }
        var elems = groups.indexed().reduce(into: [Int: Set<Int>]()) { e, tuple in
            let (v, k) = tuple
            e[k, default: []].insert(v)
        }
        return queries.compactMap { q in
            let root = find(q[1])
            if q[0] == 2 {
                elems[root]!.remove(q[1])
                return nil
            }
            return elems[root]!.contains(q[1]) ? q[1] : elems[root]!.min() ?? -1
        }
    }
    
    func tests() {
        print(processQueries(5, [[1,2],[2,3],[3,4],[4,5]], [[1,3],[2,1],[1,1],[2,2],[1,2]]))
        // [3,2,3]
        print(processQueries(3, [], [[1,1],[2,1],[1,1]])) // [1,-1]
    }
}
