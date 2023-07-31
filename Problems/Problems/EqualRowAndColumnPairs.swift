class EqualRowAndColumnPairs {
    func equalPairs(_ grid: [[Int]]) -> Int {
        let n = grid.count
        var map: [Int: [Int]] = [:]
        for i in 0..<n {
            map[grid[i][0], default: []].append(i)
        }
        func isEqual(i: Int, j: Int) -> Bool {
            for k in 1..<n {
                if grid[i][k] != grid[k][j] {
                    return false
                }
            }
            return true
        }
        var result = 0
        for j in 0..<n {
            let firstColumnNum = grid[0][j]
            for i in map[firstColumnNum] ?? [] {
                if isEqual(i: i, j: j) {
                    result += 1
                }
            }
        }
        return result
    }
    
    func equalPairs2(_ grid: [[Int]]) -> Int {
        let n = grid.count
        var hashes: [Int: Int] = [:]
        for row in grid {
            var hasher = Hasher()
            row.forEach {
                hasher.combine($0)
            }
            hashes[hasher.finalize(), default: 0] += 1
        }
        var result = 0
        for j in 0..<n {
            var hasher = Hasher()
            grid.forEach {
                hasher.combine($0[j])
            }
            if let count = hashes[hasher.finalize()] {
                result += count
            }
        }
        return result
    }
    
    func tests() {
        print(equalPairs([[3,2,1],[1,7,6],[2,7,7]])) // 1
        print(equalPairs([[3,1,2,2],[1,4,4,5],[2,4,2,2],[2,4,2,2]])) // 3
    }
}
