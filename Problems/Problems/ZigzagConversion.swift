class ZigzagConversion {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard s.count >= numRows, numRows > 1 else {
            return s
        }
        var stacks = (0..<numRows).map { _ in
            return [String]()
        }
        var down = true
        var stackIndex = 0
        for c in s {
            stacks[stackIndex].append(String(c))
            
            if ((stackIndex + 1) % numRows == 0) {
                down = false
            } else if (stackIndex % numRows == 0) {
                down = true
            }
            
            if down {
                stackIndex += 1
            } else {
                stackIndex -= 1
            }
            
        }
        let result = stacks.reduce(into: "") { partialResult, stack in
            partialResult += stack.joined()
        }
        return result
    }
    
    func tests() {
        print(convert("PAYPALISHIRING", 3)) // PAHNAPLSIIGYIR
//        P   A   H   N
//        A P L S I I G
//        Y   I   R
        print(convert("PAYPALISHIRING", 4)) // PINALSIGYAHRPI
//        P     I     N
//        A   L S   I G
//        Y A   H R
//        P     I
        print(convert("A", 1)) // A
//        A
        print(convert("AB", 1)) // AB
//        A B
    }
}
