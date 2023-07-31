class SudokuSolver {
    func solveSudoku(_ board: inout [[Character]]) {
        func isValid(_ char: Character, _ r: Int, _ c: Int) -> Bool {
            for i in 0...8 {
                if board[r][i] == char || board[i][c] == char { return false }
                if board[(r / 3) * 3 + i / 3][(c / 3) * 3 + i % 3] == char { return false }
            }
            return true
        }
        func backtrack() -> Bool {
            for r in 0..<board.count {
                for c in 0..<board[0].count where board[r][c] == "." {
                    for n in 1...9 where isValid(Character("\(n)"), r, c) {
                        board[r][c] = Character("\(n)")
                        if backtrack() {
                            return true
                        } else {
                            board[r][c] = "."
                        }
                    }
                    return false
                }
            }
            return true
        }
        backtrack()
    }

    func tests() {
        var board: [[Character]] = [
            ["5","3",".",".","7",".",".",".","."],
            ["6",".",".","1","9","5",".",".","."],
            [".","9","8",".",".",".",".","6","."],
            ["8",".",".",".","6",".",".",".","3"],
            ["4",".",".","8",".","3",".",".","1"],
            ["7",".",".",".","2",".",".",".","6"],
            [".","6",".",".",".",".","2","8","."],
            [".",".",".","4","1","9",".",".","5"],
            [".",".",".",".","8",".",".","7","9"]
        ]
        solveSudoku(&board)
        print(board) // [
//            ["5","3","4","6","7","8","9","1","2"],
//            ["6","7","2","1","9","5","3","4","8"],
//            ["1","9","8","3","4","2","5","6","7"],
//            ["8","5","9","7","6","1","4","2","3"],
//            ["4","2","6","8","5","3","7","9","1"],
//            ["7","1","3","9","2","4","8","5","6"],
//            ["9","6","1","5","3","7","2","8","4"],
//            ["2","8","7","4","1","9","6","3","5"],
//            ["3","4","5","2","8","6","1","7","9"]
//        ]
    }
}
