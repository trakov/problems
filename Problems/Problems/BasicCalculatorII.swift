class BasicCalculatorII {
    func calculate(_ s: String) -> Int {
        var op: Character = "+"
        var last = 0
        var result = 0
        var cur = 0
        for c in s + "+" where c != " " {
            if let n = c.wholeNumberValue {
                cur = cur * 10 + n
                continue
            }
            if op == "+" {
                result += last
                last = cur
            } else if op == "-" {
                result += last
                last = -cur
            } else if op == "*" {
                last *= cur
            } else if op == "/" {
                last /= cur
            }
            cur = 0
            op = c
        }
        return result + last
    }

    func calculate2(_ s: String) -> Int {
        let s = s.replacingOccurrences(of: " ", with: "").map { String($0) }
        guard !s.isEmpty else { return 0 }
        var stack: [Int] = []
        var opStack: [String] = ["+"]
        var i = 0
        while i < s.count {
            var numStr = ""
            while i < s.count && Int(s[i]) != nil {
                numStr += s[i]
                i += 1
            }
            let num = Int(numStr)!
            if opStack.last == "*" {
                stack.append(stack.removeLast() * num)
                opStack.removeLast()
            } else if opStack.last == "/" {
                stack.append(stack.removeLast() / num)
                opStack.removeLast()
            } else {
                stack.append(num)
            }
            guard i < s.count else { break }
            opStack.append(s[i])
            i += 1
        }
        var result = 0
        while !opStack.isEmpty {
            let op = opStack.removeLast()
            if op == "+" {
                result += stack.removeLast()
            } else if op == "-" {
                result -= stack.removeLast()
            }
        }
        return result
    }

    func tests() {
        print(calculate("1-1+1")) // 1
        print(calculate("3+2*2-5/5")) // 6
        print(calculate("3+2*2-5/2")) // 5
        print(calculate("3+2*2")) // 7
        print(calculate(" 3/2 ")) // 1
        print(calculate(" 3+5 / 2 ")) // 5
    }
}
