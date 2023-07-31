class SubtreeOfAnotherTree {
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        guard root != nil else { return subRoot == nil }
        guard subRoot != nil else { return true }
        var queue: [TreeNode] = [root!]
        
        while !queue.isEmpty {
            let rootNode = queue.removeFirst()
            if rootNode.left != nil { queue.append(rootNode.left!) }
            if rootNode.right != nil { queue.append(rootNode.right!) }
            if isSame(tree1: rootNode, tree2: subRoot) {
                return true
            }
        }
        
        return false
    }

    func isSame(tree1: TreeNode?, tree2: TreeNode?) -> Bool {
        guard tree1?.val == tree2?.val else { return false }
        guard tree1 != nil && tree2 != nil else { return true }
        return isSame(tree1: tree1?.left, tree2: tree2?.left) &&
        isSame(tree1: tree1?.right, tree2: tree2?.right)
    }
    
    func tests() {
        var root = TreeNode(3, TreeNode(4, TreeNode(1), TreeNode(2, TreeNode(0),nil)), TreeNode(5))
        var subRoot = TreeNode(4, TreeNode(1), TreeNode(2))
        print(isSubtree(root, subRoot)) // false
        
        root = TreeNode(3, TreeNode(4, TreeNode(1), TreeNode(2)), TreeNode(5))
        subRoot = TreeNode(4, TreeNode(1), TreeNode(2))
        print(isSubtree(root, subRoot)) // true
    }
}
