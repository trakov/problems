class ReverseOddLevelsofBinaryTree {
    func reverseOddLevels(_ root: TreeNode?) -> TreeNode? {
        func dfs(_ left: TreeNode?, _ right: TreeNode?, _ level: Int) {
            guard let left, let right else { return }
            if level % 2 == 0 {
                (left.val, right.val) = (right.val, left.val)
            }
            dfs(left.left, right.right, level + 1)
            dfs(left.right, right.left, level + 1)
        }
        dfs(root?.left, root?.right, 0)
        return root
    }
    
    func tests() {
        var tree: TreeNode? = TreeNode(2, TreeNode(3, 8, 13), TreeNode(5, 21, 34))
        tree = reverseOddLevels(tree) //
        
        tree = TreeNode(7, 13, 11)
        tree = reverseOddLevels(tree)
        print(tree!)
    }
}

