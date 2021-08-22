class NumberOfIslands {
    func numIslands(_ grid: [[Character]]) -> Int {
        var matrix = grid
        var count = 0, i = 0, j = 0
        while i < grid.count, j < grid[0].count {
            if matrix[i][j] == "1" {
                zeroNeighbours(matrix: &matrix, i, j)
                count += 1
            }
            i += 1
            if i == grid.count {
                i = 0
                j += 1
            }
        }
        
        return count
    }
    
    func zeroNeighbours(matrix: inout [[Character]], _ i: Int, _ j: Int) {
        guard i >= 0 && i < matrix.count && j >= 0 && j < matrix[0].count else {
            return
        }
        if matrix[i][j] == "1" {
            matrix[i][j] = "0"
            zeroNeighbours(matrix: &matrix, i - 1, j)
            zeroNeighbours(matrix: &matrix, i, j - 1)
            zeroNeighbours(matrix: &matrix, i, j + 1)
            zeroNeighbours(matrix: &matrix, i + 1, j)
        }
    }

    func tests() {
        print(numIslands(
            [
                ["1","0","1"],
                ["1","1","1"],
                ["0","0","0"],
                ["0","0","0"]
            ]
        )) // 1

        print(numIslands(
            [
                ["1","1","1","1","0"],
                ["1","1","0","1","0"],
                ["1","1","0","0","0"],
                ["0","0","0","0","0"]
            ]
        )) // 1

        print(numIslands(
            [
                ["1","1","0","0","0"],
                ["1","1","0","0","0"],
                ["0","0","1","0","0"],
                ["0","0","0","1","1"]
            ]
        )) // 3
    }
}
