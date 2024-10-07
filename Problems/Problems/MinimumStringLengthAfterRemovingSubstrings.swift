class MinimumStringLengthAfterRemovingSubstrings {
    func minLength(_ s: String) -> Int {
        var stack: [Character] = []
        for c in s {
            if let last = stack.last, 
                last == "A" && c == "B" || last == "C" && c == "D" {
                stack.removeLast()
            } else {
                stack.append(c)
            }
        }
        return stack.count
    }
    
    func tests() {
        print(minLength("ABFCACDB")) // 2
        print(minLength("ACBBD")) // 5
    }
}

