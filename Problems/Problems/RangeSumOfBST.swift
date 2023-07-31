class RangeSumOfBST {
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        guard let root = root else { return 0 }
        if root.val < low {
            return rangeSumBST(root.right, low, high)
        }
        if root.val > high {
            return rangeSumBST(root.left, low, high)
        }
        return root.val + rangeSumBST(root.left, low, high) + rangeSumBST(root.right, low, high)
    }
    
    func tests() {
        var tree = TreeNode(
            10,
            TreeNode(
                5,
                TreeNode(3),
                TreeNode(7)
            ),
            TreeNode(
                15,
                nil,
                TreeNode(18)
            )
        )
        
        print(rangeSumBST(tree, 7, 15)) // 32
        
        
        tree = TreeNode(
            10,
            TreeNode(
                5,
                TreeNode(3, TreeNode(1), nil),
                TreeNode(7, TreeNode(6), nil)
            ),
            TreeNode(
                15,
                TreeNode(13),
                TreeNode(18)
            )
        )
        
        print(rangeSumBST(tree, 6, 10)) // 23
    }
}
