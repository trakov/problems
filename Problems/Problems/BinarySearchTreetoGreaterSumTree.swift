class BinarySearchTreetoGreaterSumTree {
    func bstToGst(_ root: TreeNode?) -> TreeNode? {
        var sum = 0
        func helper(_ node: TreeNode?) {
            guard let node else { return }
            helper(node.right)
            sum += node.val
            node.val = sum
            helper(node.left)
        }
        helper(root)
        return root
    }
    
    func bstToGst2(_ root: TreeNode?) -> TreeNode? {
        guard root != nil else { return root }
        var stack: [TreeNode] = []
        var node = root
        var sum = 0
        while node != nil || !stack.isEmpty {
            while node != nil {
                stack.append(node!)
                node = node?.right
            }
            node = stack.removeLast()
            sum += node!.val
            node?.val = sum
            node = node?.left
        }
        return root
    }
    
    func tests() {
        var root: TreeNode? = TreeNode(
            4,
            TreeNode(1,0,TreeNode(2,nil,3)),
            TreeNode(6,5,TreeNode(7,nil,8))
        )
        print(bstToGst(root)) //
        
        root = TreeNode(0,nil,1)
        print(bstToGst(root)) // 1,nil,1
    }
}

