class BinaryTreeMaximumPathSum {
    func maxPathSum(_ root: TreeNode?) -> Int {
        var maxSum = Int.min
        dfs(root, &maxSum)
        return maxSum
    }
    
    @discardableResult
    func dfs(_ root: TreeNode?, _ maxSum: inout Int) -> Int {
        guard let root = root else { return 0 }
        let left = max(dfs(root.left, &maxSum), 0)
        let right = max(dfs(root.right, &maxSum), 0)
        maxSum = max(maxSum, (root.val + left + right))
        return root.val + max(left, right)
    }

    func tests() {
        var tree = TreeNode(
            1,
            TreeNode(2),
            TreeNode(3)
        )
        print(maxPathSum(tree)) // 6
        
        tree = TreeNode(
            -10,
            TreeNode(9),
            TreeNode(20, TreeNode(15), TreeNode(7))
        )
        print(maxPathSum(tree)) // 42
    }
}
