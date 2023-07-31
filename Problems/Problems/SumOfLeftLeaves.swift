class SumOfLeftLeaves {
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        var node = root
        var stack = [TreeNode]()
        var sum = 0
        while !stack.isEmpty || node != nil {
            while node != nil {
                stack.append(node!)
                node = node?.right
            }
            node = stack.removeLast()
            node = node?.left
            if node?.left == nil && node?.right == nil {
                sum += node?.val ?? 0
            }
        }
        return sum
    }
    
    func tests() {
        
        var root = TreeNode(3, TreeNode(9, nil, nil), TreeNode(20, TreeNode(15, nil, nil), TreeNode(7, nil, nil)))
        print(sumOfLeftLeaves(root))
    }
}
