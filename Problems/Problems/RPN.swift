class RPN {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()//Array(repeating: 0, count: Int(tokens.count * 2 / 3))
//        stack.removeAll()
        stack.reserveCapacity(Int(tokens.count * 2 / 3))
        tokens.forEach {
            if let number = Int($0) {
                stack.append(number)
            } else {
                let b = stack.removeLast()
                let a = stack.removeLast()
                switch $0 {
                case "+": stack.append(a + b)
                case "-": stack.append(a - b)
                case "*": stack.append(a * b)
                case "/": stack.append(a / b)
                default: fatalError("Bad input")
                }
            }
        }
        return stack.removeLast()
    }
    
    func tests() {
        print(evalRPN(["2","1","+","3","*"]))   // 9
        print(evalRPN(["4","13","5","/","+"]))  // 6
        print(evalRPN(["10","6","9","3","+","-11","*","/","*","17","+","5","+"]))   // 22
    }
}
