class MaximumDepthOfBinaryTree {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard var node = root else { return 0 }
        var result = 0
        var level: [TreeNode] = [node]
        while !level.isEmpty {
            let size = level.count
            for _ in (0 ..< size) {
                let n = level.removeFirst()
                if let left = n.left {
                    level.append(left)
                }
                if let right = n.right {
                    level.append(right)
                }
            }
            result += 1
        }
        
        return result
    }
    
    func recursive(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }
        return max(recursive(node.left) + 1, recursive(node.right) + 1)
    }
    
    func tests() {
        
    }
}
