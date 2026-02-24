final class SumofRootToLeafBinaryNumbers {
    func sumRootToLeaf(_ root: TreeNode?) -> Int {
        func dfs(_ node: TreeNode?, _ currentSum: Int) -> Int {
            guard let node else { return 0 }
            let newSum = currentSum * 2 + node.val
            if node.left == nil, node.right == nil {
                return newSum
            }
            return dfs(node.left, newSum) + dfs(node.right, newSum)
        }
        return dfs(root, 0)
    }
    
    func tests() {
        var root = TreeNode(1, TreeNode(0, 0, 1), TreeNode(1, 0, 1))
        print(sumRootToLeaf(root)) // 22
        root = TreeNode(0)
        print(sumRootToLeaf(root)) // 0
    }
}
