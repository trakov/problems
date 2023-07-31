private extension Character {
    var isOpen: Bool {
        return ["{", "[", "("].contains(self)
    }
    
    var isClose: Bool {
        return ["}", "]", ")"].contains(self)
    }
    
    func isSameClosed(as open: Character) -> Bool {
        self == "}" && open == "{" || self == "]" && open == "[" || self == ")" && open == "("
    }
}

class CourseParenthesis {

    func printWrongIndexOrSuccess(_ str: String) {
        var stack: [(Character, Int)] = []
        let array: [Character] = Array(str)
        for i in 0 ..< array.count {
            let c = array[i]
            if c.isOpen {
                stack.append((c, i))
            } else if c.isClose {
                if let last = stack.last, c.isSameClosed(as: last.0) {
                    stack.removeLast()
                } else {
                    print(i + 1)
                    return
                }
            }
        }
        if stack.isEmpty {
            print("Success")
        } else {
            print(stack.first!.1 + 1)
        }
    }
    
    func tests() {
        printWrongIndexOrSuccess("{}[]") // Success
        printWrongIndexOrSuccess("(())") // Success
        printWrongIndexOrSuccess("{") // 1
        printWrongIndexOrSuccess("{[}") // 3
        printWrongIndexOrSuccess("foo(bar);") // Success
        printWrongIndexOrSuccess("foo(bar[i);") // 10
        printWrongIndexOrSuccess("{") // 1
        
    }
}
