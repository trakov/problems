class BinaryTreePostorderTraversal {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard root != nil else { return [] }
        var result: [Int] = []
        var stack: [TreeNode] = [root!]
        
        while !stack.isEmpty {
            guard let n = stack.popLast() else { break }
            result.append(n.val)
            if let l = n.left { stack.append(l) }
            if let r = n.right { stack.append(r) }
        }
        return result.reversed()
    }
    
    func recursive(node: TreeNode?) -> [Int] {
        if let node = node {
            return recursive(node: node.left) + recursive(node: node.right) + [node.val]
        } else {
            return []
        }
    }
    
    func tests() {
        
    }
}
