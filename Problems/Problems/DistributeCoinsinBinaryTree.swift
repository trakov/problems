class DistributeCoinsinBinaryTree {
    func distributeCoins(_ root: TreeNode?) -> Int {
        var result = 0
        @discardableResult func dfs(_ node: TreeNode?) -> Int {
            guard let node else { return 0 }
            let left = dfs(node.left)
            let right = dfs(node.right)
            result += abs(left) + abs(right)
            return (node.val - 1) + left + right
        }
        dfs(root)
        return result
    }
    
    func tests() {
        print(distributeCoins(TreeNode(2,1,0))) // 1
        print(distributeCoins(TreeNode(3,0,0))) // 2
        print(distributeCoins(TreeNode(0,3,0))) // 3
        print(distributeCoins(TreeNode(0,TreeNode(5,0,0),0))) // 5
    }
}

