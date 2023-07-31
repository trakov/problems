class IslandPerimeter {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var perimeter = 0
        let n = grid.count
        let m = grid[0].count
        
        func isLand(_ i: Int, _ j: Int) -> Bool {
            guard i >= 0 && i < n && j >= 0 && j < m else { return false }
            return grid[i][j] == 1
        }
        
        for i in 0 ..< n {
            for j in 0 ..< m {
                if isLand(i, j) {
                    perimeter += (isLand(i, j-1) ? 0 : 1) + (isLand(i-1, j) ? 0 : 1)
                    if j == m-1 {
                        perimeter += 1
                    }
                    if i == n-1 {
                        perimeter += 1
                    }
                } else {
                    perimeter += (isLand(i, j-1) ? 1 : 0) + (isLand(i-1, j) ? 1 : 0)
                }
            }
        }
        
        return perimeter
    }

    func tests() {
        print(islandPerimeter([[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]])) // 16
        print(islandPerimeter([[1]])) // 4
        print(islandPerimeter([[1,0]])) // 4
        print(islandPerimeter([[1,1],[1,0]])) // 8
    }
}
