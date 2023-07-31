class MinimumDistanceBetweenBSTNodes {
    func minDiffInBST(_ root: TreeNode?) -> Int {
        guard root != nil else { return -1 }
        var node = root
        var stack: [TreeNode] = []
        var result = Int.max
        var prev: TreeNode?
        while node != nil || !stack.isEmpty {
            while node != nil {
                stack.append(node!)
                node = node?.left
            }
            node = stack.removeLast()
            if prev != nil {
                result = min(result, node!.val - prev!.val)
            }
            prev = node
            node = node?.right
        }
        return result
    }

    func tests() {
        var node = TreeNode(4, TreeNode(2, TreeNode(1), TreeNode(3)), TreeNode(6))
        print(minDiffInBST(node)) // 1
        
        node = TreeNode(1, TreeNode(0), TreeNode(48, TreeNode(12), TreeNode(49)))
        print(minDiffInBST(node)) // 1
    }
}
