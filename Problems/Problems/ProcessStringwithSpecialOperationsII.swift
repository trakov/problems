final class ProcessStringwithSpecialOperationsII {
    func processStr(_ s: String, _ k: Int) -> Character {
        var count = 0
        for c in s {
            switch c {
            case "*": count = max(0, count - 1)
            case "#": count *= 2
            case "%": break
            default: count += 1
            }
        }
        if k >= count { return "." }
        var k = k
        for c in s.reversed() {
            switch c {
            case "*":
                count += 1
            case "#":
                if k + 1 > (count + 1) / 2 {
                    k -= count / 2
                }
                count = (count + 1) / 2
            case "%":
                k = count - k - 1
            default:
                if k + 1 == count {
                    return c
                }
                count -= 1
            }
        }
        return "."
    }
    
    func tests() {
        print(processStr("a#b%*", 1)) // a
        print(processStr("cd%#*#", 3)) // d
        print(processStr("z*#", 0)) // .
    }
}
