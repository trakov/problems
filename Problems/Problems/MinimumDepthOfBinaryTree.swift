class MinimumDepthOfBinaryTree {
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var result = 0
        var nodes: [TreeNode] = [root]
        while !nodes.isEmpty {
            result += 1
            let size = nodes.count
//            var nextLevel: [TreeNode] = []
            for i in 0 ..< size {
                let n = nodes[i]
                if let left = n.left {
                    nodes.append(left)
                }
                if let right = n.right {
                    nodes.append(right)
                }
                if n.left == nil && n.right == nil {
                    return result
                }
            }
            nodes.removeFirst(size)
        }
        return result
    }
    
    func recursive(node: TreeNode?) -> Int {
        guard let node = node else { return 0 }
        let left = recursive(node: node.left)
        let right = recursive(node: node.right)
        return (left == 0 || right == 0 ? max(left, right) : min(left, right)) + 1
    }
    
    func recursive2(node: TreeNode?) -> Int {
        guard let node = node else { return 0 }
        if node.left == nil {
            return recursive2(node: node.right) + 1
        } else if node.right == nil {
            return recursive2(node: node.left) + 1
        }
        return min(
            recursive2(node: node.left),
            recursive2(node: node.right)
        ) + 1
    }

    func tests() {
        
    }
}
