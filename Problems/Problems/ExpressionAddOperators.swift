class ExpressionAddOperators {
    func addOperators(_ num: String, _ target: Int) -> [String] {
        var result: [String] = []
        let num = Array(num)
        let n = num.count
        func dfs(_ i: Int, _ cur: String, _ res: Int, _ temp: Int) {
            if i == n {
                if res == target {
                    result.append(cur)
                }
                return
            }
            var number = 0
            for j in i..<n {
                if j != i && num[i] == "0" { break }
                number = number * 10 + num[j].wholeNumberValue!
                if i == 0  {
                    dfs(j + 1, cur + "\(number)", number, number)
                } else {
                    dfs(j + 1, cur + "+\(number)", res + number, number)
                    dfs(j + 1, cur + "-\(number)", res - number, -number)
                    let mulValue = res - temp + (temp * number)
                    dfs(j + 1, cur + "*\(number)", mulValue, temp * number)
                }
            }
        }
        dfs(0, "", 0, 0)
        return result
    }

    func addOperators1(_ num: String, _ target: Int) -> [String] {
        let num = Array(num)
        var result: [String] = []
        let n = num.count
        
        func solve(_ exp: [String]) -> Int {
            var temp = 0
            var lastOp = "+"
            var result = 0
            for e in exp {
                if let number = Int(e) {
                    if lastOp == "*" {
                        temp *= number
                    } else {
                        result += temp
                        temp = lastOp == "+" ? number : -number
                    }
                } else {
                    lastOp = e
                }
            }
            return result + temp
        }
        
        func dfs(_ i: Int, _ cur: inout [String]) {
            if i == n {
                if solve(cur) == target { result.append(cur.joined()) }
                return
            }
            if i == 0 {
                var number = 0
                for j in i..<n {
                    number = number * 10 + (num[j].wholeNumberValue ?? 0)
                    cur.append("\(number)")
                    dfs(j + 1, &cur)
                    cur.removeLast()
                    if num[i] == "0" { break }
                }
            } else {
                var number = 0
                for j in i..<n {
                    number = number * 10 + (num[j].wholeNumberValue ?? 0)
                    cur += ["+", "\(number)"]
                    dfs(j + 1, &cur)
                    cur.removeLast(2)
                    cur += ["-", "\(number)"]
                    dfs(j + 1, &cur)
                    cur.removeLast(2)
                    cur += ["*", "\(number)"]
                    dfs(j + 1, &cur)
                    cur.removeLast(2)
                    if num[i] == "0" { break }
                }
            }
        }
        var cur: [String] = []
        dfs(0, &cur)
        return result
    }
    
    func addOperators2(_ num: String, _ target: Int) -> [String] {
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

