class InsertIntoABinarySearchTree {
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard root != nil else { return TreeNode(val) }
        var node = root
        let valNode = TreeNode(val)
        while node != nil {
            if val > node!.val {
                if node?.right == nil {
                    node?.right = valNode
                    break
                }
                node = node?.right
            } else {
                if node?.left == nil {
                    node?.left = valNode
                    break
                }
                node = node?.left
            }
        }
        
        return root
    }

    func tests() {
        
    }
}
