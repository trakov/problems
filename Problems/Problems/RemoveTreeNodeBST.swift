extension TreeNode {
    var min: TreeNode {
        left?.min ?? self
    }
}

class RemoveTreeNodeBST {
    func removeNode(with value: Int, from tree: TreeNode?) -> TreeNode? {
        guard let node = tree else { return nil }
        if value == node.val {
            guard node.left != nil || node.right != nil else { return nil }
            if node.left == nil {
                return node.right
            }
            if node.right == nil {
                return node.left
            }
            node.val = node.right!.min.val
            node.right = removeNode(with: node.val, from: node.right)
        } else if value < node.val {
            node.left = removeNode(with: value, from: node.left)
        } else {
            node.right = removeNode(with: value, from: node.right)
        }
        return node
    }
    
    func tests() {
        var node = TreeNode(
            3,
            TreeNode(1, TreeNode(0), TreeNode(2)),
            TreeNode(7, TreeNode(5, TreeNode(4), nil), TreeNode(8)))
        var ans = removeNode(with: 1, from: node)
        
        ans = removeNode(with: 5, from: node)
        
        ans = removeNode(with: 3, from: node)

    }
    
}
