class ParsingABooleanExpression {
    func parseBoolExpr(_ expression: String) -> Bool {
        var stack: [Character] = []
        for c in expression where c != "," && c != "(" {
            guard c == ")" else {
                stack.append(c)
                continue
            }
            var (hasTrue, hasFalse) = (false, false)
            while stack.last != "!" && stack.last != "&" && stack.last != "|" {
                let top = stack.popLast()
                if top == "t" { hasTrue = true }
                if top == "f" { hasFalse = true }
            }
            let op = stack.popLast()
            if op == "!" {
                stack.append(hasTrue ? "f" : "t")
            } else if op == "&" {
                stack.append(hasFalse ? "f" : "t")
            } else {
                stack.append(hasTrue ? "t" : "f")
            }
        }
        return stack.last == "t"
    }
    
    func tests() {
        print(parseBoolExpr("&(|(f))")) // false
        print(parseBoolExpr("|(f,f,f,t)")) // true
        print(parseBoolExpr("!(&(f,t))")) // true
    }
}

