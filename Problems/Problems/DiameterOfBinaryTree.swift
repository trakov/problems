class DiameterOfBinaryTree {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var h = 0
        diameter(root, h: &h)
        return h
    }
    
    func diameter(_ root: TreeNode?, h: inout Int) -> Int {
        guard let root = root else { return 0}
        let left = diameter(root.left, h: &h)
        let right = diameter(root.right, h: &h)
        h = max(h, left + right)
        return max(left, right) + 1
    }

    func tests() {
        print(diameterOfBinaryTree(TreeNode(3))) // 0
        
        var tree = TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3))
        print(diameterOfBinaryTree(tree)) // 3
        
        tree = TreeNode(1, TreeNode(2), nil)
        print(diameterOfBinaryTree(tree)) // 1
    }
}
