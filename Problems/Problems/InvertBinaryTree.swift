class InvertBinaryTree {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        var left = root.left
        root.left = invertTree(root.right)
        root.right = invertTree(left)
        return root
    }
}
