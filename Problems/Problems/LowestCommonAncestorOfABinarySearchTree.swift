class LowestCommonAncestorOfABinarySearchTree {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root === p || root === q { return root }
        guard (root!.val - p!.val).signum() == (root!.val - q!.val).signum() else { return root }
        if p!.val < root!.val {
            return lowestCommonAncestor(root?.left, p, q)
        } else {
            return lowestCommonAncestor(root?.right, p, q)
        }
    }

    func tests() {
        var p = TreeNode(
            2,
            TreeNode(0),
            TreeNode(4, TreeNode(3), TreeNode(5))
        )
        var q = TreeNode(
            8,
            TreeNode(7),
            TreeNode(9)
        )
        var tree = TreeNode(
            6,
            p,
            q
        )
        print(lowestCommonAncestor(tree, p, q)?.val) // 6
        
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
