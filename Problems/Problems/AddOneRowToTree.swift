class AddOneRowToTree {
    func addOneRow(_ root: TreeNode?, _ val: Int, _ depth: Int) -> TreeNode? {
        guard depth > 1 else { return TreeNode(val, root, nil) }
        func add(_ node: TreeNode?, _ d: Int) {
            guard let node = node else { return }
            if d < depth - 1 {
                add(node.left, d + 1)
                add(node.right, d + 1)
            } else if d == depth - 1 {
                node.left = TreeNode(val, node.left, nil)
                node.right = TreeNode(val, nil, node.right)
            }
        }
        add(root, 1)
        return root
    }
    
    func tests() {
        var root: TreeNode? = TreeNode(4, TreeNode(2, 3, 1), TreeNode(6, 5, nil))
        root = addOneRow(root, 1, 2) //
        
        root = TreeNode(4, TreeNode(2, 3, 1), nil)
        root = addOneRow(root, 1, 3) //
        
        root = TreeNode(1,2,3)
        root = addOneRow(root, 1, 1) //

    }
}

