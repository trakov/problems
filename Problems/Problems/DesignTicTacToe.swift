class DesignTicTacToe {
    private var board: [[Int]]
    private let n: Int
    init(_ n: Int = 3) {
        self.n = n
        board = Array(repeating: Array(repeating: 0, count: n), count: n)
    }
    
    func move(_ row: Int, _ col: Int, _ player: Int) -> Int {
        board[row][col] = player
        var isWin = true
        for i in 0..<n {
            if board[row][i] != player {
                isWin = false
                break
            }
        }
        if isWin { return player }
        isWin = true
        for i in 0..<n {
            if board[i][col] != player {
                isWin = false
                break
            }
        }
        if isWin { return player }
        isWin = true
        guard row == col || row == n - 1 - col else { return 0 }
        for i in 0..<n {
            if board[i][i] != player {
                isWin = false
                break
            }
        }
        if isWin { return player }
        isWin = true
        for i in 0..<n {
            if board[i][n - 1 - i] != player {
                isWin = false
                break
            }
        }
        return isWin ? player : 0
    }
    
    func tests() {
        let ttt = DesignTicTacToe(3)
        print(ttt.move(0, 0, 1)) // 0
        print(ttt.move(0, 2, 2)) // 0
        print(ttt.move(2, 2, 1)) // 0
        print(ttt.move(1, 1, 2)) // 0
        print(ttt.move(2, 0, 1)) // 0
        print(ttt.move(1, 0, 2)) // 0
        print(ttt.move(2, 1, 1)) // 1
    }
}

