class NumberofStepstoReduceaNumberinBinaryRepresentationtoOne {
    func numSteps(_ s: String) -> Int {
        var result = 0
        var one = 0
        for c in s.dropFirst().reversed() {
            let digit = Int(String(c))! + one
            if digit % 2 == 1 {
                result += 2
                one = 1
            } else {
                result += 1
            }
        }
        return result + one
    }
    
    func numSteps2(_ s: String) -> Int {
        var result = 0
        var stack = Array(s)
        while stack.count > 1 {
            let last = stack.removeLast()
            if last == "0" {
                result += 1
            } else {
                result += 2
                while stack.last == "1" {
                    stack.removeLast()
                    result += 1
                }
                if stack.last == "0" {
                    stack[stack.count - 1] = "1"
                }
            }
        }
        return result
    }
    func tests() {
        print(numSteps("11011")) // 7
        print(numSteps("1101")) // 6
        print(numSteps("10")) // 1
        print(numSteps("1")) // 0
    }
}

