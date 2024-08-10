class RegionsCutBySlashes {
    func regionsBySlashes(_ grid: [String]) -> Int {
        let n = grid.count * 3
        var result = 0
        var matrix = Array(
            repeating: Array(repeating: 0, count: n), count: n
        )
        for (i, s) in grid.enumerated() {
            for (j, c) in s.enumerated() where c != " " {
                if c == "/" {
                    matrix[3*i][3*j + 2] = 1
                    matrix[3*i + 1][3*j + 1] = 1
                    matrix[3*i + 2][3*j] = 1
                } else {
                    matrix[3*i][3*j] = 1
                    matrix[3*i + 1][3*j + 1] = 1
                    matrix[3*i + 2][3*j + 2] = 1
                }
            }
        }
        func fill(_ i: Int, _ j: Int) {
            guard i >= 0 && i < n && j >= 0 && j < n else { return }
            guard matrix[i][j] == 0 else { return }
            matrix[i][j] = -1
            for (dx, dy) in [(-1,0), (1,0), (0,-1), (0,1)] {
                fill(i + dx, j + dy)
            }
        }
        for i in 0..<n {
            for j in 0..<n {
                guard matrix[i][j] == 0 else { continue }
                result += 1
                fill(i, j)
            }
        }
        return result
    }
    
    func tests() {
        print(regionsBySlashes([" /","/ "])) // 2
        print(regionsBySlashes([" /","  "])) // 1
        print(regionsBySlashes(["/\\","\\/"])) // 5
        print(regionsBySlashes(["//","/ "])) // 3
    }
}
