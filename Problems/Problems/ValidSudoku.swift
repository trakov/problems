class ValidSudoku {
    func isValidSudoku2(_ board: [[Character]]) -> Bool {
        var columnResults = Array(repeating: [Character](), count: 9)
        var boxResults = Array(repeating: [Character](), count: 9)
        for column in board.enumerated() {
            var result = [Character]()
            for i in board[column.offset].enumerated() {
                let num = i.element
                if num != "." {
                    if result.contains(num) {
                        return false
                    }
                    result.append(num)
                    if columnResults[i.offset].contains(num) {
                        return false
                    }
                    columnResults[i.offset].append(num)
                    let index = column.offset/3 + i.offset/3 * 3
                    if boxResults[index].contains(num) {
                        return false
                    }
                    boxResults[index].append(num)
                }
            }
        }
        return true
    }

    func isValidSudoku(_ board: [[Character]]) -> Bool {
        func isValidSet(chars: [Character]) -> Bool {
            let filtered = chars.sorted().filter { $0 != "." }
            return filtered.count == Set(filtered).count
        }
        var squares: [Int: [Character]] = [:]
        var columns: [Int: [Character]] = [:]
        for i in 0 ..< board.count {
            if !isValidSet(chars: board[i]) {
                return false
            }
            for j in 0 ..< board[i].count {
                let squareIndex = j/3 + i/3 * 3
                squares[squareIndex, default: []] += [board[i][j]]
                columns[j, default: []] += [board[i][j]]
            }
        }
        for charSet in (Array(squares.values) + Array(columns.values)) {
            if !isValidSet(chars: charSet) {
                return false
            }
        }
        return true
    }

    func tests() {
        print(isValidSudoku([["5","3",".",".","7",".",".",".","."]
                             ,["6",".",".","1","9","5",".",".","."]
                             ,[".","9","8",".",".",".",".","6","."]
                             ,["8",".",".",".","6",".",".",".","3"]
                             ,["4",".",".","8",".","3",".",".","1"]
                             ,["7",".",".",".","2",".",".",".","6"]
                             ,[".","6",".",".",".",".","2","8","."]
                             ,[".",".",".","4","1","9",".",".","5"]
                             ,[".",".",".",".","8",".",".","7","9"]])) // true
        print(isValidSudoku([["8","3",".",".","7",".",".",".","."]
                             ,["6",".",".","1","9","5",".",".","."]
                             ,[".","9","8",".",".",".",".","6","."]
                             ,["8",".",".",".","6",".",".",".","3"]
                             ,["4",".",".","8",".","3",".",".","1"]
                             ,["7",".",".",".","2",".",".",".","6"]
                             ,[".","6",".",".",".",".","2","8","."]
                             ,[".",".",".","4","1","9",".",".","5"]
                             ,[".",".",".",".","8",".",".","7","9"]])) // false
        print(isValidSudoku([[".",".","4",".",".",".","6","3","."]
                             ,[".",".",".",".",".",".",".",".","."]
                             ,["5",".",".",".",".",".",".","9","."]
                             ,[".",".",".","5","6",".",".",".","."]
                             ,["4",".","3",".",".",".",".",".","1"]
                             ,[".",".",".","7",".",".",".",".","."]
                             ,[".",".",".","5",".",".",".",".","."]
                             ,[".",".",".",".",".",".",".",".","."]
                             ,[".",".",".",".",".",".",".",".","."]])) // false
    }
}
