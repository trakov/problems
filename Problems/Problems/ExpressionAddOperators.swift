class ExpressionAddOperators {
    func addOperators(_ num: String, _ target: Int) -> [String] {
        var num = Array(num)
        var result: [String] = []
        let n = num.count
        
        func solve(_ exp: [String]) -> Int {
            var temp = 0
            var lastOp = "+"
            var stack: [Int] = []
            for e in exp {
                if let number = Int(e) {
                    if lastOp == "*" {
                        stack.append(stack.removeLast() * number)
                    } else {
                        stack.append(number * (lastOp == "-" ? -1 : 1))
                    }
                } else {
                    lastOp = e
                }
            }
            return stack.reduce(0, +)
        }
        
        func dfs(_ i: Int, _ cur: [String]) {
            if i == num.count {
                if solve(cur) == target { result.append(cur.joined()) }
                return
            }
            if i == 0 {
                var number = 0
                for j in i..<n {
                    number = number * 10 + (num[j].wholeNumberValue ?? 0)
                    dfs(j + 1, ["\(number)"])
                    if num[i] == "0" { break }
                }
            } else {
                var number = 0
                for j in i..<n {
                    number = number * 10 + (num[j].wholeNumberValue ?? 0)
                    dfs(j + 1, cur + ["+", "\(number)"])
                    dfs(j + 1, cur + ["-", "\(number)"])
                    dfs(j + 1, cur + ["*", "\(number)"])
                    if num[i] == "0" { break }
                }
            }
        }
        dfs(0, [])
        return result
    }
    
    func tests() {
        print(addOperators("123", 6)) // ["1*2*3","1+2+3"]
        print(addOperators("232", 8)) // ["2*3+2","2+3*2"]
        print(addOperators("3456237490", 9191)) // []
    }
}

