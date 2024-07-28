class MinimumAddtoMakeParenthesesValid {
    func minAddToMakeValid(_ s: String) -> Int {
        var opened = 0
        var result = 0
        for c in s {
            if c == "(" {
                opened += 1
            } else {
                if opened == 0 {
                    result += 1
                } else {
                    opened -= 1
                }
            }
        }
        return result + opened
    }
    
    func minAddToMakeValid2(_ s: String) -> Int {
        var stack: [Character] = []
        var result = 0
        for c in s {
            if c == "(" {
                stack.append(c)
            } else {
                if stack.isEmpty {
                    result += 1
                } else {
                    stack.removeLast()
                }
            }
        }
        return result + stack.count
    }

    func tests() {
        print(minAddToMakeValid("())")) // 1
        print(minAddToMakeValid("(((")) // 3
    }
}

