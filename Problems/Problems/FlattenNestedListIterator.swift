class NestedInteger {
    // Return true if this NestedInteger holds a single integer, rather than a nested list.
    public func isInteger() -> Bool { return false }
    // Return the single integer that this NestedInteger holds, if it holds a single integer
    // The result is undefined if this NestedInteger holds a nested list
    public func getInteger() -> Int { return 0 }
    // Set this NestedInteger to hold a single integer.
    public func setInteger(value: Int) {}
    // Set this NestedInteger to hold a nested list and adds a nested integer to it.
    public func add(elem: NestedInteger) {}
    // Return the nested list that this NestedInteger holds, if it holds a nested list
    // The result is undefined if this NestedInteger holds a single integer
    public func getList() -> [NestedInteger] { return [] }
}

class FlattenNestedListIterator {
    private var stack: [NestedInteger]
    
    init(_ nestedList: [NestedInteger]) {
        self.stack = nestedList.reversed()
    }
    
    func next() -> Int {
        return stack.removeLast().getInteger()
    }
    
    func hasNext() -> Bool {
        while !stack.isEmpty {
            let last = stack.last!
            if last.isInteger() {
                return true
            }
            stack.removeLast()
            stack.append(contentsOf: last.getList().reversed())
        }
        return false
    }
    
    func tests() {
//        print(<#name#>) //
    }
}

