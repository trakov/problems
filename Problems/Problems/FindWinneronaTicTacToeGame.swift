class FindWinneronaTicTacToeGame {
    func tictactoe(_ moves: [[Int]]) -> String {
        guard moves.count > 4 else { return "Pending" }
        let n = 3
        var rows = Array(repeating: 0, count: n)
        var cols = Array(repeating: 0, count: n)
        var diag = 0
        var antiDiag = 0
        var player = 1
        for move in moves {
            let row = move[0]
            let col = move[1]
            rows[row] += player
            cols[col] += player
            if row == col {
                diag += player
            }
            if row + col == n - 1 {
                antiDiag += player
            }
            if abs(rows[row]) == n || abs(cols[col]) == n
                || abs(diag) == n || abs(antiDiag) == n {
                return player == 1 ? "A" : "B"
            }
            player *= -1
        }
        return moves.count == n * n ? "Draw" : "Pending"
    }
    
    func tests() {
        print(tictactoe([[0,0],[2,0],[1,1],[2,1],[2,2]])) // A
        print(tictactoe([[0,0],[1,1],[0,1],[0,2],[1,0],[2,0]])) // B
        print(tictactoe([[0,0],[1,1],[2,0],[1,0],[1,2],[2,1],[0,1],[0,2],[2,2]])) // Draw
    }
}

