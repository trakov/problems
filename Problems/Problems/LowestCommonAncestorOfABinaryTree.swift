class LowestCommonAncestorOfABinaryTree {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root, let p = p, let q = q else { return nil }
        if root.val == p.val || root.val == q.val { return root }
        let left = lowestCommonAncestor(root.left, p, q)
        let right = lowestCommonAncestor(root.right, p, q)
        if left != nil, right != nil {
            return root
        }
        return left ?? right
    }
    
    func tests() {
        var p = TreeNode(
            5,
            TreeNode(6),
            TreeNode(2, TreeNode(7), TreeNode(4))
        )
        var q = TreeNode(
            1,
            TreeNode(0),
            TreeNode(8)
        )
        var tree = TreeNode(
            3,
            p,
            q
        )
        print(lowestCommonAncestor(tree, p, q)?.val) // 3
        
        var q1 = TreeNode(4, TreeNode(3), TreeNode(5))
        p = TreeNode(
            2,
            TreeNode(0),
            q1
        )

        tree = TreeNode(
            6,
            p,
            q
        )
        print(lowestCommonAncestor(tree, p, q1)?.val) // 2
    }
}
