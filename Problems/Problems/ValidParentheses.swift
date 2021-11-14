let openedBraces: [Character] = ["(", "{", "["]
let closedBraces: [Character] = [")", "}", "]"]
extension Character {
    func isOpened() -> Bool {
        return openedBraces.contains(self)
    }
    func isClosed(like opened: Self) -> Bool {
        guard let index = openedBraces.firstIndex(of: opened) else {
            return false
        }
        return self == closedBraces[index]
    }
}
class ValidParentheses {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        for c in s {
            if c.isOpened() {
                stack.append(c)
            } else if stack.isEmpty {
                return false
            } else if !c.isClosed(like: stack.removeLast()) {
                return false
            }
        }
        return stack.isEmpty
    }

    func tests() {
        print(isValid("()"))    //true
        print(isValid("()[]{}"))//true
        print(isValid("(]"))    //false
        print(isValid("([)]"))  //false
        print(isValid("{[]}"))  //true
    }
}
