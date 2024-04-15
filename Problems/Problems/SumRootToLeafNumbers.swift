class SumRootToLeafNumbers {
    func sumNumbers(_ root: TreeNode?, _ sum: Int = 0) -> Int {
        guard let root = root else { return 0 }
        let sum = 10 * sum + root.val
        if root.left == nil && root.right == nil {
            return sum
        }
        return sumNumbers(root.left, sum) + sumNumbers(root.right, sum)
    }

    func sumNumbers2(_ root: TreeNode?) -> Int {
        func helper(_ node: TreeNode?, _ sum: Int) -> Int {
            guard let node = node else { return 0 }
            let newSum = sum * 10 + node.val
            if node.left == nil && node.right == nil {
                return newSum
            }
            return helper(node.left, newSum) + helper(node.right, newSum)
        }
        return helper(root, 0)
    }

    func tests() {
        var tree: TreeNode = TreeNode(1, TreeNode(2), TreeNode(3))
        print(sumNumbers(tree)) // 25
        
        tree = TreeNode(4, TreeNode(9, TreeNode(5), TreeNode(1)), TreeNode(0))
        print(sumNumbers(tree)) // 1026
    }
}
