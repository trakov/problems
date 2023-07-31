class BinaryTreePreorderTraversal {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        var stack: [TreeNode] = []
        var node = root
        while node != nil || !stack.isEmpty {
            while node != nil {
                result.append(node!.val)
                stack.append(node!)
                node = node?.left
            }
            node = stack.removeLast()
            node = node?.right
        }
        
        return result
    }
    
    func recursive(_ node: TreeNode?) -> [Int] {
        guard let node = node else {
            return []
        }
        return [node.val] + recursive(node.left) + recursive(node.right)
    }

    func tests() {
        
    }
}
