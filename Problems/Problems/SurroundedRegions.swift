class SurroundedRegions {
    func solve(_ board: inout [[Character]]) {
        guard board.count > 2, board[0].count > 2 else { return }
        let m = board.count
        let n = board[0].count
        let dxy = [(0,1), (0,-1), (1,0), (-1,0)]
        func dfs(i: Int, j: Int) {
            guard board[i][j] != "X" else { return }
            board[i][j] = "-"
            for (dx, dy) in dxy {
                let x = i + dx
                let y = j + dy
                guard x>=0, x<m, y>=0, y<n else { continue }
                guard board[x][y] == "O" else { continue }
                board[x][y] = "-"
                dfs(i: x, j: y)
            }
        }
        for i in 0..<m {
            dfs(i: i, j: 0)
            dfs(i: i, j: n-1)
        }
        for j in 1..<n-1 {
            dfs(i: 0, j: j)
            dfs(i: m-1, j: j)
        }
        for i in 0..<m {
            for j in 0..<n {
                if board[i][j] == "-" {
                    board[i][j] = "O"
                } else if board[i][j] == "O" {
                    board[i][j] = "X"
                }
            }
        }
    }
    
    func tests() {
        var board: [[Character]] = [["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]]
        solve(&board)
        print(board) // [["X","X","X","X"],["X","X","X","X"],["X","X","X","X"],["X","O","X","X"]]

        board = [["X"]]
        solve(&board)
        print(board) // [["X"]]

        board = [["O","O","O"],["O","O","O"],["O","O","O"]]
        solve(&board)
        print(board)
        
        board = [["X","O","X"],["X","O","X"],["X","O","X"]]
        solve(&board)
        print(board)
    }
}
