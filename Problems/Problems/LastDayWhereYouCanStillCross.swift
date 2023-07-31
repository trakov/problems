class LastDayWhereYouCanStillCross {
    class UnionFind {
        private var root: [Int]
        private var rank: [Int]
        
        init(_ n: Int) {
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
            if rank[rootX] > rank[rootY] {
                root[rootY] = rootX
            } else if rank[rootY] > rank[rootX] {
                root[rootX] = rootY
            } else {
                root[rootY] = rootX
                rank[rootX] += 1
            }
        }
    }

    func latestDayToCross(_ row: Int, _ col: Int, _ cells: [[Int]]) -> Int {
        let count = cells.count
        let uf = UnionFind(row * col+2)
        var cellIndices: Set<Int> = []
        let lastRow = (row-1)*col
        for i in 0..<col {
            uf.union(i+1, 0)
            uf.union(lastRow+i+1, row * col + 1)
        }
        for i in (0..<count).reversed() {
            let cell = cells[i]
            let curRow = cell[0] - 1
            let curCol = cell[1] - 1
            let cellIndex = curRow * col + curCol
            for pair in [(-1,0),(1,0),(0,-1),(0,1)] {
                let nextRow = curRow + pair.0
                if nextRow < 0 || nextRow >= row { continue }
                let nextCol = curCol + pair.1
                if nextCol < 0 || nextCol >= col { continue }
                let nextCellIndex = nextRow * col + nextCol
                if cellIndices.contains(nextCellIndex) {
                    uf.union(cellIndex+1, nextCellIndex+1)
                }
            }
            cellIndices.insert(cellIndex)
            if uf.find(0) == uf.find(row * col+1) {
                return i
            }
        }
        return -1
    }
    
    func tests() {
        print(latestDayToCross(2, 2, [[1,1],[2,1],[1,2],[2,2]])) // 2
        print(latestDayToCross(2, 2, [[1,1],[1,2],[2,1],[2,2]])) // 1
        print(latestDayToCross(3, 3, [[1,2],[2,1],[3,3],[2,2],[1,1],[1,3],[2,3],[3,2],[3,1]])) // 3
    }
}

