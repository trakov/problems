class MaximumWidthOfBinaryTree {
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var level = [(root, 0)]
        var result = 1
        while !level.isEmpty {
            let first = level.first!
            let last = level.last!
            result = max(result, last.1 - first.1 + 1)
            var count = level.count
            for _ in 0..<count {
                let (node, idx) = level.removeFirst()
                if let left = node.left {
                    level.append((left, (idx - first.1) * 2 - 1))
                }
                if let right = node.right {
                    level.append((right, (idx - first.1) * 2))
                }
            }
        }
        return result
    }
    
    func tests() {
        var root = TreeNode(1, TreeNode(3, 5, 3), TreeNode(2, nil, 9))
        print(widthOfBinaryTree(root)) // 4
        
        root = TreeNode(
            1,
            TreeNode(3, TreeNode(5, 6, nil), nil),
            TreeNode(2, nil, TreeNode(9, 7, nil))
        )
        print(widthOfBinaryTree(root)) // 7

        root = TreeNode(1, TreeNode(3, 5, nil), 2)
        print(widthOfBinaryTree(root)) // 2
    }
}
