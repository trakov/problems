class BinaryTreePostorderTraversal {
    // single stack
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        var stack: [TreeNode] = []
        var node = root
        var prev: TreeNode?
        while node != nil || !stack.isEmpty {
            while node != nil {
                stack.append(node!)
                node = node?.left
            }
            node = stack.last
            if node?.right == nil || node?.right === prev {
                result.append(node!.val)
                stack.removeLast()
                prev = node
                node = nil
            } else {
                node = node?.right
            }
        }
        return result
    }
    
    // opposite of preorder
    func postorderTraversal1(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        var stack: [TreeNode] = []
        var node = root
        while node != nil || !stack.isEmpty {
            while node != nil {
                result.append(node!.val)
                stack.append(node!)
                node = node?.right
            }
            node = stack.removeLast()
            node = node?.left
        }
        return result.reversed()
    }

    func postorderTraversal2(_ root: TreeNode?) -> [Int] {
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
