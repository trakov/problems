class NumberOfProvinces {
    
    class UnionFind {
        private(set) var count: Int
        private var root: [Int]
        private var rank: [Int]
        
        init(_ n: Int) {
            count = n
            root = Array(0..<n)
            rank = Array(repeating: 1, count: n)
        }
        
        func find(_ x: Int) -> Int {
            if x == root[x] {
                return x
            }
            root[x] = find(root[x])
            return root[x]
        }
        
        func union(_ x: Int, _ y: Int) {
            let rootX = find(x)
            let rootY = find(y)
            guard rootX != rootY else { return }
            count -= 1
            if rank[rootX] > rank[rootY] {
                root[rootY] = rootX
            } else if rank[rootY] > rank[rootX] {
                root[rootX] = rootY
            } else {
                root[rootY] = rootX
                rank[rootX] += 1
            }
        }
        
        func isConnected(_ x: Int, _ y: Int) -> Bool {
            find(x) == find(y)
        }
    }
    
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        let n = isConnected.count
        guard n > 1 else { return 1 }
        var uf = UnionFind(n)
        for i in 0..<n-1 {
            for j in i+1..<n {
                if isConnected[i][j] == 1 {
                    uf.union(i, j)
                }
            }
        }
        return uf.count
    }

    func findCircleNum2(_ isConnected: [[Int]]) -> Int {
        guard isConnected.count > 1 else { return 1 }
        var isConnected = isConnected // to store visited with -1
        var count = 0
        var cities = Array(0..<isConnected.count)
        
        while !cities.isEmpty {
            let city = cities.removeFirst()
            count += 1
            var queue = [city]
            while !queue.isEmpty {
                let q = queue.removeFirst()
                for i in 0..<isConnected.count {
                    if isConnected[q][i] == 1 || isConnected[i][q] == 1 {
                        queue.append(i)
                        cities.removeAll { $0 == i }
                        isConnected[i][q] = -1
                        isConnected[q][i] = -1
                    }
                }
            }
        }
        
        return count
    }

    func tests() {
        print(findCircleNum([[1,0,0,1],[0,1,1,0],[0,1,1,1],[1,0,1,1]])) // 1
        print(findCircleNum([[1,1,0],[1,1,0],[0,0,1]])) // 2
        print(findCircleNum([[1,0,0],[0,1,0],[0,0,1]])) // 3
    }
}
