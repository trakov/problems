class MaximumNestingDepthOfTheParentheses {
    func maxDepth(_ s: String) -> Int {
        var result = 0
        var cur = 0
        for c in s {
            if c == "(" {
                cur += 1
            } else if c == ")" {
                cur -= 1
            }
            result = max(result, cur)
        }
        return result
    }
    
    func tests() {
        print(maxDepth("")) // 0
        print(maxDepth("()")) // 1
        print(maxDepth("(())")) // 2
        print(maxDepth("()()")) // 1
        print(maxDepth("(1+(2*3)+((8)/4))+1")) // 3
        print(maxDepth("(1)+((2))+(((3)))")) // 3
    }
}

