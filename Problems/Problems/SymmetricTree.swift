class SymmetricTree {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        return nonRecursive(root.left, root.right)
    }
    
    func nonRecursive(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        var p = left
        var q = right
        var pStack: [TreeNode] = []
        var qStack: [TreeNode] = []
        while p != nil || q != nil || !qStack.isEmpty || !pStack.isEmpty {
            while p != nil || q != nil {
                guard p?.val == q?.val else { return false }
                pStack.append(p!)
                p = p?.left
                qStack.append(q!)
                q = q?.right
            }
            guard p?.val == q?.val else { return false }
            p = pStack.removeLast()
            p = p?.right
            q = qStack.removeLast()
            q = q?.left
        }
        return true
    }
    
    func recursive(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        guard p != nil || q != nil else { return true }
        guard p?.val == q?.val else { return false }
        return recursive(p?.left, q?.right) && recursive(p?.right, q?.left)
    }
    
    func tests() {
        
    }
}
