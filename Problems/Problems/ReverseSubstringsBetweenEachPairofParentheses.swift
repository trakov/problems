class ReverseSubstringsBetweenEachPairofParentheses {
    func reverseParentheses(_ s: String) -> String {
        var stack: [Int] = []
        var result: [Character] = []
        for c in s {
            if c == "(" {
                stack.append(result.count)
            } else if c == ")" {
                var start = stack.removeLast()
                var end = result.count - 1
                while start < end {
                    result.swapAt(start, end)
                    start += 1
                    end -= 1
                }
            } else {
                result.append(c)
            }
        }
        return String(result)
    }
    
    func tests() {
        print(reverseParentheses("(abcd)")) // dcba
        print(reverseParentheses("(u(love)i)")) // iloveu
        print(reverseParentheses("(ed(et(oc))el)")) // leetcode
    }
}
