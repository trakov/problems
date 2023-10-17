class ValidateBinaryTreeNodes {
    func validateBinaryTreeNodes(_ n: Int, _ leftChild: [Int], _ rightChild: [Int]) -> Bool {
        func findRoot() -> Int? {
            let children = Set(leftChild + rightChild)
            guard children.count == n else { return nil }
            for i in 0..<n where !children.contains(i) {
                return i
            }
            return nil
        }
        guard let root = findRoot() else { return false }
        var seen: Set<Int> = [root]
        var queue: [Int] = [root]
        while !queue.isEmpty {
            let node = queue.removeFirst()
            let children = [leftChild[node], rightChild[node]]
            for child in children {
                guard child != -1 else { continue }
                guard !seen.contains(child) else { return false }
                queue.append(child)
                seen.insert(child)
            }
        }
        return seen.count == n
    }

    func tests() {
        print(validateBinaryTreeNodes(4, [1,-1,3,-1], [2,-1,-1,-1])) // true
        print(validateBinaryTreeNodes(4, [1,-1,3,-1], [2,3,-1,-1])) // false
        print(validateBinaryTreeNodes(2, [1,0], [-1,-1])) // false
    }
}

