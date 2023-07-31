class LongestZigZagPathInABinaryTree {
    func longestZigZag(_ root: TreeNode?) -> Int {
        var result = 0
        func dfs(node: TreeNode?, goLeft: Bool, steps: Int) {
            guard node != nil else { return }
            result = max(result, steps)
            dfs(node: node?.left, goLeft: false, steps: goLeft ? steps + 1 : 1)
            dfs(node: node?.right, goLeft: true, steps: goLeft ? 1 : steps + 1)
        }
        dfs(node: root, goLeft: true, steps: 0)
        return result
    }
    
    func tests() {
        var root = TreeNode(
            1,
            nil,
            TreeNode(
                1,
                TreeNode(1),
                TreeNode(
                    1,
                    TreeNode(1, nil, TreeNode(1, nil, TreeNode(1))),
                    TreeNode(1)
                )
            ))
        print(longestZigZag(root)) // 3
        
        root = TreeNode(
            1,
            TreeNode(
                1, nil,
                TreeNode(
                    1,
                    TreeNode(1, nil, TreeNode(1)),
                    TreeNode(1)
                )
            ),
            TreeNode(1)
        )

        print(longestZigZag(root)) // 4
        
        root = TreeNode(1)
        print(longestZigZag(root)) // 0
    }
}

