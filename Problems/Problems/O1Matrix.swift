class O1Matrix {
    func updateMatrix0(_ mat: [[Int]]) -> [[Int]] {
        let n = mat.count
        let m = mat[0].count
        var result = Array(repeating: Array(repeating: -1, count: m), count: n)
        
        func neighbours(_ i: Int, _ j: Int) -> [(Int, Int)] {
            [(-1,0),(1,0),(0,-1),(0,1)].compactMap { dx, dy in
                let x = i + dx
                let y = j + dy
                guard x >= 0 && x < n && y >= 0 && y < m else { return nil }
                return (x, y)
            }
        }
        var queue: [(Int, Int)] = []
        for i in 0..<n {
            for j in 0..<m where mat[i][j] == 0 {
                result[i][j] = 0
                queue.append((i, j))
            }
        }

        while !queue.isEmpty {
            let (x, y) = queue.removeFirst()
            let value = result[x][y]
            for (i, j) in neighbours(x, y) where result[i][j] == -1 {
                result[i][j] = value + 1
                queue.append((i, j))
            }
        }

        return result
    }

    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        var dist = Array(repeating: Array(repeating: -1, count: mat[0].count), count: mat.count)
        let dxy = [(1,0), (-1,0), (0,1), (0, -1)]
        
        var queue: [(Int, Int)] = []
        for (i, row) in mat.enumerated() {
            for (j ,value) in row.enumerated() {
                guard value == 0 else { continue }
                queue.append((i, j))
                dist[i][j] = 0
            }
        }
        
        while !queue.isEmpty {
            let (i, j) = queue.removeFirst()
            let value = dist[i][j]
            for (dx, dy) in dxy {
                let x = i + dx
                let y = j + dy
                guard x >= 0, x < mat.count, y >= 0, y < mat[0].count else { continue }
                guard dist[x][y] == -1 else { continue }
                dist[x][y] = value + 1
                queue.append((x, y))
            }
        }
        
        return dist
    }

    func updateMatrix2(_ mat: [[Int]]) -> [[Int]] {
        var mat = mat
        fillOnesAndMinusOnes(&mat)
        fillNumbers(&mat, with: 2)
        return mat
    }
    
    func fillOnesAndMinusOnes(_ mat: inout [[Int]]) {
        var i = 0
        var j = 0
        while i < mat.count {
            j=0
            while j < mat[i].count {
                if mat[i][j] != 0 {
                    let minValue = minNearestValue(mat, i: i, j: j)
                    if minValue == 0 {
                        mat[i][j] = 1
                    } else {
                        mat[i][j] = -1
                    }
                }
                j+=1
            }
            i+=1
        }
    }
    
    func fillNumbers(_ mat: inout [[Int]], with num: Int) {
        var shouldProceed = false
        var i = 0
        var j = 0
        while i < mat.count {
            j=0
            while j < mat[i].count {
                if mat[i][j] != 0 && mat[i][j] == num-1 {
                    if i - 1 >= 0 && mat[i-1][j] == -1 {
                        mat[i-1][j] = num
                        shouldProceed = true
                    }
                    if j - 1 >= 0 && mat[i][j-1] == -1 {
                        mat[i][j-1] = num
                        shouldProceed = true
                    }
                    if i + 1 < mat.count && mat[i+1][j] == -1 {
                        mat[i+1][j] = num
                        shouldProceed = true
                    }
                    if j + 1 < mat[i].count && mat[i][j+1] == -1 {
                        mat[i][j+1] = num
                        shouldProceed = true
                    }
                }
                j+=1
            }
            i+=1
        }
        if shouldProceed {
            fillNumbers(&mat, with: num+1)
        }
    }

    func minNearestValue(_ mat: [[Int]], i: Int, j: Int) -> Int {
        var minValue = Int.max
        if i - 1 >= 0 && mat[i-1][j] != -1 {
            minValue = min(minValue, mat[i-1][j])
        }
        if j - 1 >= 0 && mat[i][j-1] != -1 {
            minValue = min(minValue, mat[i][j-1])
        }
        if i + 1 < mat.count && mat[i+1][j] != -1 {
            minValue = min(minValue, mat[i+1][j])
        }
        if j + 1 < mat[i].count && mat[i][j+1] != -1 {
            minValue = min(minValue, mat[i][j+1])
        }
        return minValue
    }

    func tests() {
//        print(updateMatrix([[0,0,0],[0,1,0],[0,0,0]])) // [[0,0,0],[0,1,0],[0,0,0]]
        print(updateMatrix([[0,0,0],[0,1,0],[1,1,1]])) // [[0,0,0],[0,1,0],[1,2,1]]
//        print(updateMatrix([[1,0,1,1,0,0,1,0,0,1],[0,1,1,0,1,0,1,0,1,1],[0,0,1,0,1,0,0,1,0,0],[1,0,1,0,1,1,1,1,1,1],[0,1,0,1,1,0,0,0,0,1],[0,0,1,0,1,1,1,0,1,0],[0,1,0,1,0,1,0,0,1,1],[1,0,0,0,1,1,1,1,0,1],[1,1,1,1,1,1,1,0,1,0],[1,1,1,1,0,1,0,0,1,1]])) //
//        print(updateMatrix([[1,1,0,0,1,0,0,1,1,0],[1,0,0,1,0,1,1,1,1,1],[1,1,1,0,0,1,1,1,1,0],[0,1,1,1,0,1,1,1,1,1],[0,0,1,1,1,1,1,1,1,0],[1,1,1,1,1,1,0,1,1,1],[0,1,1,1,1,1,1,0,0,1],[1,1,1,1,1,0,0,1,1,1],[0,1,0,1,1,0,1,1,1,1],[1,1,1,0,1,0,1,1,1,1]]))
    }
}
