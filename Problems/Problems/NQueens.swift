class NQueens {
    func solveNQueens(_ n: Int) -> [[String]] {
        var result: [[Int]] = []
        func backtarck(_ path: [Int]) {
            if path.count == n {
                result.append(path)
            }
            var path = path
            var available = Array(0..<n)
            for (i, val) in path.enumerated() {
                available.removeAll {
                    [val - (path.count - i), val, val + (path.count - i)].contains($0)
                }
            }
            for i in available {
                path.append(i)
                backtarck(path)
                path.removeLast()
            }
        }
        
        backtarck([])
        
        return result.map({ (path: [Int]) -> [String] in
            var res: [String] = []
            for i in path {
                var string = ""
                for j in 0..<n { string += (i == j ? "Q" : ".") }
                res.append(string)
            }
            return res
        })
    }

    func tests() {
        print(solveNQueens(1)) // [["Q"]]
        print(solveNQueens(2)) // []
        print(solveNQueens(3)) // []
        print(solveNQueens(4)) // [[".Q..","...Q","Q...","..Q."],["..Q.","Q...","...Q",".Q.."]]
    }
}
