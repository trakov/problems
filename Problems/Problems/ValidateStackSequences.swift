class ValidateStackSequences {
    func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
        guard pushed.count > 2 else { return true }
        let n = pushed.count
        var stack: [Int] = []
        var i = 0
        var j = 0
        while i <= n && j <= n {
            if i < n && j < n && pushed[i] == popped[j] {
                i += 1
                j += 1
            } else if j < n && stack.last == popped[j] {
                stack.popLast()
                j += 1
            } else if i < n {
                stack.append(pushed[i])
                i += 1
            } else {
                i += 1
            }
        }
        return stack.isEmpty
    }
    
    func tests() {
        print(validateStackSequences([2,1,3,0], [1,0,3,2])) // true
        print(validateStackSequences([0,2,1], [0,1,2])) // true
        print(validateStackSequences([1,2,3,4,5], [4,5,3,2,1])) // true
        print(validateStackSequences([1,2,3,4,5], [4,3,5,1,2])) // false
        print(validateStackSequences([1,2,3,4,5], [4,3,5,2,1])) // true
    }
}

