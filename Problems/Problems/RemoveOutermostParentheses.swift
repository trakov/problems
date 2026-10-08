final class RemoveOutermostParentheses {
    func removeOuterParentheses(_ s: String) -> String {
        var level = 0
        var result = ""
        for c in s {
            if c == ")" {
                level -= 1
            }
            if level > 0 {
                result.append(c)
            }
            if c == "(" {
                level += 1
            }
        }
        return result
    }
    
    func tests() {
        print(removeOuterParentheses("(()())(())")) // "()()()"
        print(removeOuterParentheses("(()())(())(()(()))")) // "()()()()(())"
        print(removeOuterParentheses("()()")) // ""
    }
}
