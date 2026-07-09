final class PathExistenceQueriesinaGraphI {
    class UnionFind {
        private var root: [Int]
        private var rank: [Int]
        init(_ n: Int) {
            root = Array(0..<n)
            rank = Array(repeating: 0, count: n)
        }
        
        func find(_ x: Int) -> Int {
            if x == root[x] { return x }
            root[x] = find(root[x])
            return root[x]
        }
        
        func union(_ x: Int, _ y: Int) {
            let rx = find(x)
            let ry = find(y)
            guard rx != ry else { return }
            if rank[rx] < rank[ry] {
                root[rx] = ry
            } else if rank[rx] > rank[ry] {
                root[ry] = rx
            } else {
                root[rx] = ry
                rank[ry] += 1
            }
        }
    }
    func pathExistenceQueries(_ n: Int, _ nums: [Int], _ maxDiff: Int, _ queries: [[Int]]) -> [Bool] {
        let uf = UnionFind(n)
        for i in 1..<n where nums[i] - nums[i-1] <= maxDiff {
            uf.union(i, i-1)
        }
        return queries.map {
            uf.find($0[0]) == uf.find($0[1])
        }
    }
    
    func tests() {
        print(pathExistenceQueries(2, [1,3], 1, [[0,0],[0,1]])) // [true,false]
        print(pathExistenceQueries(4, [2,5,6,8], 2, [[0,1],[0,2],[1,3],[2,3]])) // [false,false,true,true]
    }
}
