class MinimumAbsoluteDifferenceInBST {
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        var stack: [TreeNode] = []
        var node = root
        var prev: TreeNode?
        var result = Int.max
        while node != nil || !stack.isEmpty {
            while node != nil {
                stack.append(node!)
                node = node!.left
            }
            node = stack.removeLast()
            result = min(result, node!.val - (prev?.val ?? -100_000))
            prev = node
            node = node!.right
        }
        return result
    }

    func tests() {
        var tree = TreeNode(
            4,
            TreeNode(2, TreeNode(1), TreeNode(3)),
            TreeNode(6, nil, nil)
        )
        
        print(getMinimumDifference(tree)) // 1

        tree = TreeNode(
            1,
            TreeNode(0, nil, nil),
            TreeNode(48, TreeNode(12), TreeNode(49))
        )

        print(getMinimumDifference(tree)) // 1

        tree = TreeNode(
            8,
            TreeNode(0, nil, nil),
            TreeNode(48, TreeNode(12), TreeNode(49))
        )
        
        print(getMinimumDifference(tree)) // 1
    }
}
