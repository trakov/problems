class CountNodesEqualToAverageOfSubtree {
    func averageOfSubtree(_ root: TreeNode?) -> Int {
        var result = 0
        @discardableResult
        func postOrder(_ root: TreeNode?) -> (Int, Int) {
            guard let root else { return (0, 0) }
            let left = postOrder(root.left)
            let right = postOrder(root.right)
            let nodeSum = left.0 + right.0 + root.val
            let nodeCount = left.1 + right.1 + 1
            if root.val == nodeSum / nodeCount {
                result += 1
            }
            return (nodeSum, nodeCount)
        }
        postOrder(root)
        return result
    }
    
    func tests() {
        var root = TreeNode(4, TreeNode(8, 0, 1), TreeNode(5, nil, 6))
        print(averageOfSubtree(root)) // 5
        root = TreeNode(1)
        print(averageOfSubtree(root)) // 1
    }
}

