final class SmallestSubtreewithalltheDeepestNodes {
    func subtreeWithAllDeepest(_ root: TreeNode?) -> TreeNode? {
        func dfs(_ root: TreeNode?) -> (TreeNode?, Int) {
            guard let root else { return (nil, 0) }
            let left = dfs(root.left)
            let right = dfs(root.right)
            if left.1 > right.1 {
                return (left.0, left.1 + 1)
            }
            if left.1 < right.1 {
                return (right.0, right.1 + 1)
            }
            return (root, left.1 + 1)
        }
        return dfs(root).0
    }
    
    func tests() {
        var root = TreeNode(
            3,
            TreeNode(5, 6, TreeNode(2, 7, 4)),
            TreeNode(1, 0, 8)
        )
        return print(root)
        print(subtreeWithAllDeepest(root)) // 2,7,4
        root = 1
        print(subtreeWithAllDeepest(root)) // 1
        root = TreeNode(0, TreeNode(1, nil, 2), 3)
        print(subtreeWithAllDeepest(root)) // 2
    }
}
