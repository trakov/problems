class SameTree {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        
        return recursive(p, q)
        
        var pNode = p
        var qNode = q
        var pStack: [TreeNode] = []
        var qStack: [TreeNode] = []
        while pNode != nil || qNode != nil || !pStack.isEmpty || !qStack.isEmpty {
            guard pNode?.val == qNode?.val else { return false }
            while pNode != nil || qNode != nil {
                if let pN = pNode, let qN = qNode {
                    pStack.append(pN)
                    pNode = pN.left
                    qStack.append(qN)
                    qNode = qN.left
                } else {
                    return false
                }
                guard pNode?.val == qNode?.val else { return false }
            }
            pNode = pStack.removeLast()
            pNode = pNode?.right
            qNode = qStack.removeLast()
            qNode = qNode?.right
        }
        return pNode?.val == qNode?.val
    }
    
    func recursive(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        guard (p != nil || q != nil) else { return true }
        guard p?.val == q?.val else { return false }
        return true && recursive(p?.left, q?.left) && recursive(p?.right, q?.right)
    }
    
    func tests() {
        
    }
}
