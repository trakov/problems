class MagicSquaresInGrid {
    func numMagicSquaresInside(_ grid: [[Int]]) -> Int {
        let n = grid.count
        let m = grid[0].count
        guard n > 2 && m > 2 else { return 0 }
        var result = 0
        
        func checkSquare(_ x: Int, _ y: Int) -> Bool {
            guard grid[x-1][y-1] + grid[x+1][y+1] == 10 else { return false }
            guard grid[x-1][y] + grid[x+1][y] == 10 else { return false }
            guard grid[x-1][y+1] + grid[x+1][y-1] == 10 else { return false }
            guard grid[x][y-1] + grid[x][y+1] == 10 else { return false }
            var set: Set<Int> = []
            for i in x-1...x+1 {
                for j in y-1...y+1 {
                    guard grid[i][j] > 0 && grid[i][j] < 10 else { return false }
                    guard set.insert(grid[i][j]).inserted else { return false }
                }
            }
            guard grid[x-1][y-1] + grid[x-1][y] + grid[x-1][y+1] == 15 else { return false }
            guard grid[x-1][y-1] + grid[x][y-1] + grid[x+1][y-1] == 15 else { return false }
            return true
        }
        
        for i in 1..<n-1 {
            for j in 1..<m-1 {
                guard grid[i][j] == 5 else { continue }
                if checkSquare(i, j) {
                    result += 1
                }
            }
        }
        
        return result
    }
    
    func tests() {
        print(numMagicSquaresInside([[4,3,8,4],[9,5,1,9],[2,7,6,2]])) // 1
        print(numMagicSquaresInside([[8]])) // 0
    }
}

