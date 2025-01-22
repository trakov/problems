class MapofHighestPeak {
    func highestPeak(_ isWater: [[Int]]) -> [[Int]] {
        let m = isWater.count
        let n = isWater[0].count
        let total = m * n
        var result = isWater
        var points = [[Int]](), index = 0
        for i in 0..<m {
            for j in 0..<n {
                if result[i][j] == 1 {
                    points.append([i, j])
                }
                result[i][j] -= 1
            }
        }
        let dir = [0, 1, 0, -1, 0]
        while index < total {
            let p = points[index]
            let i = p[0], j = p[1]
            for k in 0...3 {
                let a = i + dir[k], b = j + dir[k + 1]
                if a < 0 || a == m || b < 0 || b == n || result[a][b] != -1 {
                    continue
                }
                result[a][b] = result[i][j] + 1
                points.append([a, b])
            }
            index += 1
        }
        return result
    }
    
    func tests() {
        print(highestPeak([[0,1],[0,0]])) // [[1,0],[2,1]]
        print(highestPeak([[0,0,1],[1,0,0],[0,0,0]])) // [[1,1,0],[0,1,1],[1,2,2]]
    }
}

