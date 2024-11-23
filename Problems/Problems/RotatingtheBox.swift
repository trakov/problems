class RotatingtheBox {
    func rotateTheBox(_ box: [[Character]]) -> [[Character]] {
        let m = box.count
        let n = box[0].count
        var result: [[Character]] = Array(
            repeating: Array(repeating: ".", count: m), count: n
        )
        for i in 0..<m {
            var last = n - 1
            for j in (0..<n).reversed() {
                if box[i][j] == "#" {
                    result[last][m - i - 1] = "#"
                    last -= 1
                }
                if box[i][j] == "*" {
                    result[j][m - i - 1] = "*"
                    last = j - 1
                }
            }
        }
        return result
    }
    
    func tests() {
        print(rotateTheBox([["#",".","#"]]))// [["."],["#"],["#"]]
        print(rotateTheBox([["#",".","*","."],
                            ["#","#","*","."]]))
//       [["#","."],
//        ["#","#"],
//        ["*","*"],
//        [".","."]]
        print(rotateTheBox([["#","#","*",".","*","."],
                            ["#","#","#","*",".","."],
                            ["#","#","#",".","#","."]]))
//       [[".","#","#"],
//        [".","#","#"],
//        ["#","#","*"],
//        ["#","*","."],
//        ["#",".","*"],
//        ["#",".","."]]
    }
}

