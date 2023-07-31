class MergeTwoBinaryTrees {
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        guard root1 != nil && root2 != nil else { return root1 ?? root2 }
        root1!.val += root2!.val
        root1?.left = mergeTrees(root1?.left, root2?.left)
        root1?.right = mergeTrees(root1?.right, root2?.right)
        return root1
    }

    func tests() {
        var t1 = TreeNode(1, TreeNode(3, TreeNode(5), nil), TreeNode(2))
        var t2 = TreeNode(2, TreeNode(1, nil, TreeNode(4)), TreeNode(3, nil, TreeNode(7)))
        
        print(mergeTrees(t1, t2))
    }
}
