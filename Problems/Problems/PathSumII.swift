class PathSumII {
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        func dfs(_ node: TreeNode?, _ sum: Int, _ path: [Int]) -> [[Int]] {
            guard let node = node else { return [] }
            var updSum = sum - node.val
            var updPath = path + [node.val]
            if node.left == nil && node.right == nil && 0 == updSum {
                return [updPath]
            }
            return dfs(node.left, updSum, updPath) + dfs(node.right, updSum, updPath)
        }
        return dfs(root, targetSum, [])
    }

    func tests() {
        var root = TreeNode(
            5,
            TreeNode(
                4, TreeNode(11, TreeNode(7), TreeNode(2)), nil
            ),
            TreeNode(
                8, TreeNode(13), TreeNode(4, TreeNode(5), TreeNode(1))
            )
        )
        print(pathSum(root, 22)) // [[5,4,11,2],[5,8,4,5]]
        
        root = TreeNode(1, TreeNode(2), TreeNode(3))
        print(pathSum(root, 5)) // []

        root = TreeNode(1, TreeNode(2), nil)
        print(pathSum(root, 0)) // []
    }
}

