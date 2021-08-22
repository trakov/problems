class ValidSudoku {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
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
    }
}
