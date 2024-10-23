class CousinsinBinaryTreeII {
    func replaceValueInTree(_ root: TreeNode?) -> TreeNode? {
        guard let root else { return nil }
        var nodeQueue = [root]
        var previousLevelSum = root.val
        while !nodeQueue.isEmpty {
            var currentLevelSum = 0
            var next: [TreeNode] = []
            for node in nodeQueue {
                node.val = previousLevelSum - node.val
                let sum = (node.left?.val ?? 0) + (node.right?.val ?? 0)
                if let left = node.left {
                    currentLevelSum += left.val
                    left.val = sum
                    next.append(left)
                }
                if let right = node.right {
                    currentLevelSum += right.val
                    right.val = sum
                    next.append(right)
                }
            }
            nodeQueue = next
            previousLevelSum = currentLevelSum
        }
        return root
    }
    
    func tests() {
        var tree = replaceValueInTree(
            TreeNode(5, TreeNode(4, 1, 10), TreeNode(9, nil, 7))
        )
        tree = replaceValueInTree(
            TreeNode(3, 1, 2)
        )
        print(tree)
    }
}

