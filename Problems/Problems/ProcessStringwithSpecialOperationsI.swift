final class ProcessStringwithSpecialOperationsI {
    func processStr(_ s: String) -> String {
        var result: [Character] = []
        for c in s {
            switch c {
            case "*":
                _ = result.popLast()
            case "#":
                result += result
            case "%":
                result = result.reversed()
            default:
                result.append(c)
            }
        }
        return String(result)
    }
    
    func tests() {
        print(processStr("a#b%*")) // "ba"
        print(processStr("z*#")) // ""
    }
}
