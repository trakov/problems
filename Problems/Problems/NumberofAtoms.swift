class NumberofAtoms {
    func countOfAtoms(_ formula: String) -> String {
        var stack: [[String: Int]] = [[:]]
        var number = 0
        var element = ""
        var isPopped = false
        func helper() {
            if !element.isEmpty {
                stack[stack.count - 1][element, default: 0] += max(number, 1)
            }
            if isPopped {
                for pair in stack[stack.count - 1] {
                    stack[stack.count - 1][pair.key] = max(number, 1) * pair.value
                }
                let popped = stack.removeLast()
                for pair in popped {
                    stack[stack.count - 1][pair.key, default: 0] += pair.value
                }
            }
            (number, element, isPopped) = (0, "", false)
        }
        for char in formula {
            if char.isNumber {
                number = 10 * number + Int(String(char))!
            } else if char == "(" {
                helper()
                stack.append([:])
            } else if char == ")" {
                helper()
                isPopped = true
            } else if char.isUppercase {
                helper()
                element = "\(char)"
            } else {
                element = "\(element)\(char)"
            }
        }
        helper()
        return stack.last!
            .sorted { $0.key < $1.key }
            .map { "\($0.key)\($0.value > 1 ? "\($0.value)" : "")" }
            .joined()
    }
    
    func tests() {
        print(countOfAtoms("H2O")) // "H2O"
        print(countOfAtoms("Mg(OH)2")) // "H2MgO2"
        print(countOfAtoms("K4(ON(SO3)2)2")) // "K4N2O14S4"
    }
}

