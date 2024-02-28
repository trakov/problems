class FindBottomLeftTreeValue {
    func findBottomLeftValue(_ root: TreeNode?) -> Int {
        guard let root = root else { fatalError() }
        var level = [root]
        while !level.isEmpty {
            var nextLevel: [TreeNode] = []
            for node in level {
                nextLevel.append(contentsOf: [node.left, node.right].compactMap { $0 })
            }
            guard !nextLevel.isEmpty else {
                break
            }
            level = nextLevel
        }
        return level.first!.val
    }
    
    func tests() {
        var root: TreeNode? = TreeNode(2, 1, 3)
        print(findBottomLeftValue(root)) // 1
        
        root = TreeNode(
            1,
            TreeNode(2, 3, nil),
            TreeNode(3, TreeNode(5, 7, nil), 6)
        )
        print(findBottomLeftValue(root)) // 7
        
    }
}

