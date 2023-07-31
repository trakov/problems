class GenerateParentheses {
    func generateParenthesis(_ n: Int) -> [String] {
        var result: [String] = []
        func gen(_ path: String, _ openCount: Int, _ closeCount: Int) {
            if path.count == 2 * n {
                result.append(path)
                return
            }
            if openCount < n {
                gen(path + "(", openCount + 1, closeCount)
            }
            if closeCount < openCount {
                gen(path + ")", openCount, closeCount + 1)
            }
        }
        gen("", 0, 0)
        return result
    }

    func generateParenthesis2(_ n: Int) -> [String] {
        var result: [String] = []
        var path = ""
        func backtrack(_ openCount: Int, _ closeCount: Int) {
            if path.count == 2 * n {
                result.append(path)
                return
            }
            if openCount < n {
                path.append("(")
                backtrack(openCount + 1, closeCount)
                path.removeLast()
            }
            if closeCount < openCount {
                path.append(")")
                backtrack(openCount, closeCount + 1)
                path.removeLast()
            }
        }
        backtrack(0, 0)
        return result
    }

    func tests() {
        print(generateParenthesis(3)) // ["((()))","(()())","(())()","()(())","()()()"]
        print(generateParenthesis(1)) // ["()"]
    }
}
