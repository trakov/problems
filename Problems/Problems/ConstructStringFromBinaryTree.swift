class ConstructStringFromBinaryTree {
    func tree2str(_ root: TreeNode?) -> String {
        guard let root else { return "" }
        var val = root.val
        if root.left == nil && root.right == nil {
            return "\(val)"
        } else if root.right == nil {
            return "\(val)(\(tree2str(root.left)))"
        } else if root.left == nil {
            return "\(val)()(\(tree2str(root.right)))"
        } else {
            return "\(val)(\(tree2str(root.left)))(\(tree2str(root.right)))"
        }
    }
    
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
    
    func tests() {
        var node = TreeNode(1, TreeNode(2, 4, nil), 3)
        print(tree2str(node)) // "1(2(4))(3)"
        node = TreeNode(1, TreeNode(2, nil, 4), 3)
        print(tree2str(node)) // "1(2()(4))(3)"
    }
}

