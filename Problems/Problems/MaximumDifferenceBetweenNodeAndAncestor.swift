class MaximumDifferenceBetweenNodeAndAncestor {
    func maxAncestorDiff(_ root: TreeNode?) -> Int {
        minMaxInPath(root, minValue: Int.max, maxValue: Int.min)
    }
    
    func minMaxInPath(_ node: TreeNode?, minValue: Int, maxValue: Int) -> Int {
        guard let node = node else { return maxValue - minValue }
        let mx = max(node.val, maxValue)
        let mn = min(node.val, minValue)
        return max(
            minMaxInPath(node.left, minValue: mn, maxValue: mx),
            minMaxInPath(node.right, minValue: mn, maxValue: mx)
        )
    }

    func tests() {
        var tree = TreeNode(
            8,
            TreeNode(3, TreeNode(1), TreeNode(6, TreeNode(4), TreeNode(7))),
            TreeNode(10, nil, TreeNode(14, TreeNode(13), nil))
        )
        print(maxAncestorDiff(tree))
        
        tree = TreeNode(
            1,
            nil,
            TreeNode(2, nil, TreeNode(0, TreeNode(3), nil))
        )
        print(maxAncestorDiff(tree))
    }
}
