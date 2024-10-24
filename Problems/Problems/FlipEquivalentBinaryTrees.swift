class FlipEquivalentBinaryTrees {
    func flipEquiv(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        guard let root1, let root2 else { return root1?.val == root2?.val }
        guard root1.val == root2.val else { return false }
        return flipEquiv(root1.left, root2.left) && flipEquiv(root1.right, root2.right) ||
        flipEquiv(root1.left, root2.right) && flipEquiv(root1.right, root2.left)
    }
    
    func tests() {
        print(flipEquiv(TreeNode(
            1, TreeNode(2, 4, TreeNode(5, 7, 8)), TreeNode(3, 6, nil)
        ), TreeNode(
            1, TreeNode(3, nil, 6), TreeNode(2, 4, TreeNode(5, 8, 7))
        ))) // true
        print(flipEquiv(nil, nil)) // true
        print(flipEquiv(nil, 1)) // false
    }
}

