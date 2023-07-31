class PathSum {
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        return recursive(node: root, target: targetSum)
        
        guard let root = root else { return false }
        var candidates: [TreeNode] = [root]
        while !candidates.isEmpty {
            let size = candidates.count
            for i in 0 ..< size {
                let n = candidates[i]
                if n.left == nil && n.right == nil {
                    if n.val == targetSum {
                        return true
                    }
                }
                if let left = n.left {
                    candidates.append(TreeNode(left.val + n.val, left.left, left.right))
                }
                if let right = n.right {
                    candidates.append(TreeNode(right.val + n.val, right.left, right.right))
                }
            }
            candidates.removeFirst(size)
        }
        
        return false
    }
    
    func recursive(node: TreeNode?, target: Int) -> Bool {
        guard let node = node else { return false }
        if node.left == nil && node.right == nil && node.val == target { return true }
        return recursive(node: node.left, target: target - node.val)
        || recursive(node: node.right, target: target - node.val)
    }
    
    func tests() {
        
    }
}
