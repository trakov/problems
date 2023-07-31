class MinimumRemoveToMakeValidParentheses {
    func minRemoveToMakeValid(_ s: String) -> String {
        var stack: [Int] = []
        var indices = Array(repeating: true, count: s.count)
        
        for (i, c) in s.enumerated() {
            if c == "(" {
                stack.append(i)
            } else if c == ")" {
                if stack.isEmpty {
                    indices[i] = false
                } else {
                    stack.removeLast()
                }
            }
        }
        for i in stack {
            indices[i] = false
        }
        return s.enumerated().reduce(into: "") {
            if indices[$1.offset] {
                $0.append($1.element)
            }
        }
    }
    
    func tests() {
        print(minRemoveToMakeValid("lee(t(c)o)de)")) // "lee(t(c)o)de"
        print(minRemoveToMakeValid("a)b(c)d")) // "ab(c)d"
        print(minRemoveToMakeValid("))((")) // ""
    }
}

