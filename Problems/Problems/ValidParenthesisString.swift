class ValidParenthesisString {
    func checkValidString(_ s: String) -> Bool {
        func check(forward: Bool) -> Bool {
            var stack: [Character] = []
            var stars = 0
            let char: Character = forward ? "(" : ")"
            let collection: any Collection<Character> = (forward ? s : s.reversed())
            for c in collection {
                if c == "*" {
                    stars += 1
                } else if c == char {
                    stack.append(c)
                } else {
                    if stack.last == char {
                        stack.removeLast()
                    } else if stars > 0 {
                        stars -= 1
                    } else {
                        return false
                    }
                }
            }
            return stack.count <= stars
        }
        return check(forward: true) && check(forward: false)
    }
    
    func tests() {
        print(checkValidString("(")) // false
        print(checkValidString(")**")) // false
        print(checkValidString("()(***")) // true
        print(checkValidString("**(")) // false
        print(checkValidString("()")) // true
        print(checkValidString("(*)")) // true
        print(checkValidString("(*))")) // true
    }
}

