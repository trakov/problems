class DeleteNodeInABST {
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        guard let node = root else { return nil }
        if key > node.val {
            node.right = deleteNode(node.right, key)
        } else if key < node.val {
            node.left = deleteNode(node.left, key)
        } else {
            if node.left == nil && node.right == nil { return nil }
            if node.left == nil { return node.right }
            if node.right == nil { return node.left }
            node.val = node.right!.min.val
            node.right = deleteNode(node.right, node.val)
        }
        return node
    }

    func tests() {
        var root = TreeNode(
            5,
            TreeNode(
                3, TreeNode(2), TreeNode(4)
            ),
            TreeNode(
                6, nil, TreeNode(7)
            )
        )
        var n = deleteNode(root, 5)
        
        root = TreeNode(
            5,
            TreeNode(
                2, nil, TreeNode(4)
            ),
            TreeNode(
                6, nil, TreeNode(7)
            )
        )
        n = deleteNode(root, 0)
        
        root = TreeNode(1)
        n = deleteNode(root, 1)
    }
}

