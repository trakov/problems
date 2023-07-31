class BalanceABinarySearchTree {
    func balanceBST(_ root: TreeNode?) -> TreeNode? {
        guard root != nil else { return nil }
        var array: [TreeNode] = []
        var stack: [TreeNode] = []
        var node = root
        while node != nil || !stack.isEmpty {
            while node != nil {
                stack.append(node!)
                node = node?.left
            }
            node = stack.removeLast()
            array.append(node!)
            node = node?.right
        }
        
        return build(array: array, i: 0, j: array.count - 1)
    }

    func build(array: [TreeNode], i: Int, j: Int) -> TreeNode? {
        guard i <= j else { return nil }
        let mid = (i + j) / 2
        let node = array[mid]
        node.left = build(array: array, i: i, j: mid - 1)
        node.right = build(array: array, i: mid + 1, j: j)
        return node
    }
    
    func tests() {
        var tree: TreeNode? = TreeNode(
            1,
            nil,
            TreeNode(
                2,
                nil,
                TreeNode(3, nil, TreeNode(4))
            )
        )
        var res = balanceBST(tree)
        
        tree = TreeNode(2, TreeNode(1), TreeNode(3))
        res = balanceBST(tree)

        tree = TreeNode(1, TreeNode(0), TreeNode(5))
        res = balanceBST(tree)
    }
}
