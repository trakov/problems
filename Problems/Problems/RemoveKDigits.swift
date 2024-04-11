class RemoveKDigits {
    func removeKdigits(_ num: String, _ k: Int) -> String {
        guard k < num.count else { return "0" }
        var stack: [Character] = []
        var k = k
        for c in num {
            while k > 0 && !stack.isEmpty && stack.last! > c {
                stack.removeLast()
                k -= 1
            }
            stack.append(c)
        }
        while k > 0 {
            stack.removeLast()
            k -= 1
        }
        var result = ""
        for c in stack where !(result.isEmpty && c == "0") {
            result.append(c)
        }
        return result.isEmpty ? "0" : result
    }
    
    func tests() {
        print(removeKdigits("1432219", 3)) // "1219"
        print(removeKdigits("10200", 1)) // "200"
        print(removeKdigits("10", 2)) // 0
        print(removeKdigits("100", 2)) // 0
        print(removeKdigits("001", 2)) // 0
        print(removeKdigits("001", 0)) // 1
    }
}

