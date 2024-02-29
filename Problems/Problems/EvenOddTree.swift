class EvenOddTree {
    func isEvenOddTree(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        var level: [TreeNode] = [root]
        var isEven = true
        while !level.isEmpty {
            var nextLevel: [TreeNode] = []
            for (i, node) in level.enumerated() {
                defer {
                    nextLevel.append(contentsOf: [node.left, node.right].compactMap { $0 })
                }
                guard (node.val % 2 == 0) != isEven else { return false }
                guard i > 0 else { continue }
                if isEven {
                    guard node.val > level[i - 1].val else { return false }
                } else {
                    guard node.val < level[i - 1].val else { return false }
                }
            }
            isEven.toggle()
            level = nextLevel
        }
        return true
    }
    
    func tests() {
        var root: TreeNode? = TreeNode(
            1,
            TreeNode(10, TreeNode(3, 12, 8), nil),
            TreeNode(4, TreeNode(7, 6, nil), TreeNode(9, nil, 2))
        )
        print(isEvenOddTree(root)) // true
        
        root = TreeNode(
            5,
            TreeNode(4, 3, 3),
            TreeNode(2, 7, nil)
        )
        print(isEvenOddTree(root)) // false
        
        root = TreeNode(
            5,
            TreeNode(9, 3, 5),
            TreeNode(1, 7, nil)
        )
        print(isEvenOddTree(root)) // false
    }
}

