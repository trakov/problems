class LongestValidParentheses {
    func longestValidParentheses(_ s: String) -> Int {
        var result = 0
        var stack: [Int] = [-1]
        for (i, c) in s.enumerated() {
            if c == "(" {
                stack.append(i)
            } else {
                stack.popLast()
                if stack.isEmpty {
                    stack.append(i)
                } else {
                    result = max(result, i - stack.last!)
                }
            }
        }
        return result
    }
    
    func tests() {
        print(longestValidParentheses("(()")) // 2
        print(longestValidParentheses(")()())")) // 4
        print(longestValidParentheses("")) // 0
    }
}

