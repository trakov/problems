class CheckCompletenessOfABinaryTree {
    func isCompleteTree(_ root: TreeNode?) -> Bool {
        guard root != nil else { return true }
        var level = [root!]
        var nilDetected = false

        while !level.isEmpty {
            var nextLevel: [TreeNode] = []
            for node in level {
                if node.left != nil {
                    if nilDetected { return false }
                    nextLevel.append(node.left!)
                } else {
                    nilDetected = true
                }
                if node.right != nil {
                    if nilDetected { return false }
                    nextLevel.append(node.right!)
                } else {
                    nilDetected = true
                }
            }
            level = nextLevel
        }
        
        return true
    }

    func tests() {
        var tree = TreeNode(
            1,
            TreeNode(2, TreeNode(4), TreeNode(5)),
            TreeNode(3, TreeNode(6), nil)
        )
        print(isCompleteTree(tree)) // true
        
        tree = TreeNode(
            1,
            TreeNode(2, TreeNode(4), TreeNode(5)),
            TreeNode(3, nil, TreeNode(7))
        )
        print(isCompleteTree(tree)) // false

        tree = TreeNode(
            1,
            TreeNode(2),
            nil
        )
        print(isCompleteTree(tree)) // true

        tree = TreeNode(
            1,
            TreeNode(2, TreeNode(4), nil),
            TreeNode(3, nil, nil)
        )
        print(isCompleteTree(tree)) // true

        tree = TreeNode(
            1,
            TreeNode(2, nil, nil),
            TreeNode(3, TreeNode(4), nil)
        )
        print(isCompleteTree(tree)) // false

        tree = TreeNode()
        print(isCompleteTree(tree)) // true
    }
}

