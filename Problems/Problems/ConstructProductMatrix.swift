final class ConstructProductMatrix {
    func constructProductMatrix(_ grid: [[Int]]) -> [[Int]] {
        var (p, s) = (1, 1)
        let (n, m) = (grid.count, grid[0].count)
        let mod = 12345
        var result = grid
        for i in (0...n-1).reversed() {
            for j in (0...m-1).reversed() {
                result[i][j] = s
                s = (s * grid[i][j]) % mod
            }
        }
        for i in 0..<n {
            for j in 0..<m {
                result[i][j] = (result[i][j] * p) % mod
                p = (p * grid[i][j]) % mod
            }
        }
        return result
    }
    
    func tests() {
        print(constructProductMatrix([[1,2],[3,4]])) // [[24,12],[8,6]]
        print(constructProductMatrix([[12345],[2],[1]])) // [[2],[0],[0]]
        print(constructProductMatrix([[1, 2, 3]])) // [[6, 3, 2]]
    }
}
