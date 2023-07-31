class BalancedBinaryTree {
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard root != nil else { return true }
        return abs(height(node: root?.left) - height(node: root?.right)) <= 1
    }
    
    func height(node: TreeNode?) -> Int {
        guard node != nil else { return 0 }
        return max(height(node: node?.left), height(node: node?.right)) + 1
    }
    
    func tests() {
        
    }
}
