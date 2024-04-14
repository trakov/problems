class SumOfLeftLeaves {
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        var level = [root!]
        var result = 0
        while !level.isEmpty {
            var nextLevel: [TreeNode] = []
            for node in level {
                if let left = node.left {
                    nextLevel.append(left)
                    if left.left == nil && left.right == nil { result += left.val }
                }
                if let right = node.right {
                    nextLevel.append(right)
                }
            }
            level = nextLevel
        }
        return result
    }
    
    func sumOfLeftLeaves2(_ root: TreeNode?) -> Int {
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
        print(sumOfLeftLeaves(root)) // 24
    }
}
