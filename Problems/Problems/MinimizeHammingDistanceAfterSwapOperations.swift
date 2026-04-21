final class MinimizeHammingDistanceAfterSwapOperations {
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

    func minimumHammingDistance(_ source: [Int], _ target: [Int], _ allowedSwaps: [[Int]]) -> Int {
        let n = source.count
        let uf = UnionFind(n)
        for swap in allowedSwaps {
            uf.union(swap[0], swap[1])
        }
        var map: [Int: [Int: Int]] = [:]
        for (i, s) in source.enumerated() {
            let f = uf.find(i)
            map[f, default: [:]][s, default: 0] += 1
        }
        var result = 0
        for (i, t) in target.enumerated() {
            let f = uf.find(i)
            if let c = map[f]?[t], c > 0 {
                map[f]?[t] = c - 1
            } else {
                result += 1
            }
        }
        return result
    }
    
    func tests() {
        print(minimumHammingDistance([1,2,3,4], [2,1,4,5], [[0,1],[2,3]])) // 1
        print(minimumHammingDistance([1,2,3,4], [1,3,2,4], [])) // 2
        print(minimumHammingDistance([5,1,2,4,3], [1,5,4,2,3], [[0,4],[4,2],[1,3],[1,4]])) // 0
    }
}
