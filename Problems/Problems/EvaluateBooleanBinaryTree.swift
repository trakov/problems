class EvaluateBooleanBinaryTree {
    func evaluateTree(_ root: TreeNode?) -> Bool {
        guard let val = root?.val else { return false }
        if val == 0 { return false }
        if val == 1 { return true }
        let left = evaluateTree(root?.left)
        let right = evaluateTree(root?.right)
        if val == 2 {
            return left || right
        } else {
            return left && right
        }
    }
    
    func tests() {
        print(evaluateTree(TreeNode(2,1,TreeNode(3,0,1)))) // true
        print(evaluateTree(TreeNode(0))) // false
    }
}

