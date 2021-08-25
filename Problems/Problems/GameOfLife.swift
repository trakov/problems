class GameOfLife {
    func gameOfLife(_ board: inout [[Int]]) {
        for i in board.enumerated() {
            for j in i.element.enumerated() {
                let sum = neighborsSum(board, i: i.offset, j: j.offset)
                if (j.element == 0 || j.element == 3) && sum == 3 {
                    board[i.offset][j.offset] = 3
                } else if (j.element == 1 || j.element == 2) && (sum < 2 || sum > 3) {
                    board[i.offset][j.offset] = 2
                }
            }
        }
        for i in board.enumerated() {
            for j in i.element.enumerated() {
                if j.element == 3 { board[i.offset][j.offset] = 1 }
                else if j.element == 2 { board[i.offset][j.offset] = 0 }
            }
        }
    }
    
    func neighborsSum(_ board: [[Int]], i: Int, j: Int) -> Int {
        return ([
            (i - 1, j - 1),
            (i - 1, j),
            (i - 1, j + 1),
            (i, j - 1),
            (i, j + 1),
            (i + 1, j - 1),
            (i + 1, j),
            (i + 1, j + 1)
        ].reduce(0) { sum, c in
            if c.0 >= 0, c.1 >= 0, c.0 < board.count, c.1 < board[0].count {
                return sum + (board[c.0][c.1] > 1 ? -board[c.0][c.1] + 3 : board[c.0][c.1])
            } else {
                return sum
            }
        })
    }
    
    func tests() {
        var board = [[0,1,0],[0,0,1],[1,1,1],[0,0,0]]
        gameOfLife(&board)
        print(board) // [[0,0,0],[1,0,1],[0,1,1],[0,1,0]]
        
        board = [[1,1],[1,0]]
        gameOfLife(&board)
        print(board) // [[1,1],[1,1]]
        
    }
}
