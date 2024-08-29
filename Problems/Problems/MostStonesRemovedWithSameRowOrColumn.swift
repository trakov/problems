class MostStonesRemovedWithSameRowOrColumn {
    class UnionFind {
        var count = 0
        private var root: [Int]
        private var rank: [Int]
        init(_ n: Int) {
            root = Array(0..<n)
            rank = Array(repeating: 0, count: n)
            count = n
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
            count -= 1
        }
    }
    
    func removeStones(_ stones: [[Int]]) -> Int {
        let n = stones.count
        let uf = UnionFind(n)
        for (i, stone) in stones.enumerated() {
            for j in i+1..<n where stone[0] == stones[j][0] || stone[1] == stones[j][1] {
                uf.union(i, j)
            }
        }
        return n - uf.count
    }
    
    func removeStones2(_ stones: [[Int]]) -> Int {
        var xStones: [Int: [Int]] = [:]
        var yStones: [Int: [Int]] = [:]
        for s in stones {
            xStones[s[0], default: []].append(s[1])
            yStones[s[1], default: []].append(s[0])
        }
        
        var count = 0
        while !xStones.isEmpty {
            let firstX = xStones.first!.key
            removeXRecursively(with: firstX, xStones: &xStones, yStones: &yStones)
            count += 1
        }
        return stones.count - count
    }
    
    func removeXRecursively(with x: Int, xStones: inout [Int: [Int]], yStones: inout [Int: [Int]]) {
        guard let xstonesYValues = xStones.removeValue(forKey: x) else {
            return
        }
        for yValue in xstonesYValues {
            for xValue in yStones[yValue]! {
                removeXRecursively(with: xValue, xStones: &xStones, yStones: &yStones)
            }
        }
    }

    func tests() {
        print(removeStones([[0,0],[0,1],[1,0],[1,2],[2,1],[2,2]])) // 5
        print(removeStones([[0,0],[0,2],[1,1],[2,0],[2,2]])) // 3
        print(removeStones([[0,0]])) // 0
    }
}
