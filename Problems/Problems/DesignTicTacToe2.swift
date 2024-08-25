class DesignTicTacToe2 {
    private let n: Int
    private var rows: [Int]
    private var cols: [Int]
    private var diag = 0
    private var diag2 = 0
    
    init(_ n: Int = 3) {
        self.n = n
        rows = Array(repeating: 0, count: n)
        cols = Array(repeating: 0, count: n)
    }
    
    func move(_ row: Int, _ col: Int, _ player: Int) -> Int {
        let cur = player == 1 ? 1 : -1
        rows[row] += cur
        cols[col] += cur
        if row == col { diag += cur }
        if row == n - 1 - col { diag2 += cur }
        let win = cur * n
        if rows[row] == win || cols[col] == win || diag == win || diag2 == win {
            return player
        }
        return 0
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
