class CheckingExistenceOfEdgeLengthLimitedPaths {
    func distanceLimitedPathsExist(_ n: Int, _ edgeList: [[Int]], _ queries: [[Int]]) -> [Bool] {
        let edgeList = edgeList.sorted { $0[2] < $1[2] } // sort by distance
        var queries = queries.enumerated().sorted { $0.1[2] < $1.1[2] } // sort by limit
        var result = Array(repeating: false, count: queries.count)
        let uf = UnionFind(n)
        var edgeIndex = 0
        
        for (queryIndex, query) in queries {
            let p = query[0]
            let q = query[1]
            let limit = query[2]
            
            while edgeIndex < edgeList.count && edgeList[edgeIndex][2] < limit {
                let edge = edgeList[edgeIndex]
                uf.union(edge[0], edge[1])
                edgeIndex += 1
            }
            
            result[queryIndex] = uf.find(p) == uf.find(q)
        }
        
        return result
    }
    
    final class UnionFind {
        var parent: [Int]
        var rank: [Int]
        
        init(_ size: Int) {
            parent = Array(0..<size)
            rank = Array(repeating: 0, count: size)
        }
        
        func find(_ x: Int) -> Int {
            if parent[x] != x {
                parent[x] = find(parent[x])
            }
            return parent[x]
        }
        
        func union(_ x: Int, _ y: Int) {
            let rootX = find(x)
            let rootY = find(y)
            
            if rootX != rootY {
                if rank[rootX] > rank[rootY] {
                    parent[rootY] = rootX
                } else if rank[rootX] < rank[rootY] {
                    parent[rootX] = rootY
                } else {
                    parent[rootY] = rootX
                    rank[rootX] += 1
                }
            }
        }
    }
    
    func tests() {
        print(distanceLimitedPathsExist(3, [[0,1,2],[1,2,4],[2,0,8],[1,0,16]], [[0,1,2],[0,2,5]]))
        // [false,true]
        print(distanceLimitedPathsExist(5, [[0,1,10],[1,2,5],[2,3,9],[3,4,13]], [[0,4,14],[1,4,13]]))
        // [true, false]
    }
}

