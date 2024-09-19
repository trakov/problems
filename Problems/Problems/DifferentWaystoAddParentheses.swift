class DifferentWaystoAddParentheses {
    func diffWaysToCompute(_ expression: String) -> [Int] {
        var result: [Int] = []
        guard !expression.isEmpty else { return result }
        if expression.count == 1 {
            result.append(Int(expression)!)
            return result
        }
        if expression.count == 2 && expression.first!.isNumber {
            result.append(Int(expression)!)
            return result
        }
        let expression = Array(expression)
        for (i, c) in expression.enumerated() where !c.isNumber {
            let left = diffWaysToCompute(String(expression.prefix(upTo: i)))
            let right = diffWaysToCompute(String(expression.suffix(from: i + 1)))
            for leftValue in left {
                for rightValue in right {
                    var computedResult = 0
                    switch c {
                    case "+": computedResult = leftValue + rightValue
                    case "-": computedResult = leftValue - rightValue
                    case "*": computedResult = leftValue * rightValue
                    default: break
                    }
                    result.append(computedResult)
                }
            }
        }
        return result
    }
    
    func tests() {
        print(diffWaysToCompute("2-1-1")) // [0,2]
        print(diffWaysToCompute("2*3-4*5")) // [-34,-14,-10,-10,10]
    }
}
