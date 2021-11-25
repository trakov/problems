class RemoveAllAdjacentDuplicates {
    func removeDuplicates(_ s: String) -> String {
        var stack = [Character]()
        for c in s {
            if let top = stack.last, top == c {
                stack.removeLast()
            } else {
                stack.append(c)
            }
        }
        return String(stack)
    }
    
    func tests() {
        print(removeDuplicates("abbaca")) // ca
        print(removeDuplicates("azxxzy")) // ay
    }
}
