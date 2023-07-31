class BinaryTreeZigzagLevelOrderTraversal {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard root != nil else { return [] }
        var queue: [TreeNode] = [root!]
        var result: [[Int]] = [[root!.val]]
        while !queue.isEmpty {
            var nextQueue: [TreeNode] = []
            var nextResult: [Int] = []
            for node in queue {
                if let left = node.left {
                    nextQueue.append(left)
                    nextResult.append(left.val)
                }
                if let right = node.right {
                    nextQueue.append(right)
                    nextResult.append(right.val)
                }
            }
            guard !nextResult.isEmpty else { break }
            result.append(result.count % 2 != 0 ? nextResult.reversed() : nextResult)
            queue = nextQueue
        }
        
        return result
    }

    func tests() {
        var node: TreeNode?
        
        node = TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)))
        print(zigzagLevelOrder(node)) // [[3],[20,9],[15,7]]
        
        node = TreeNode(1)
        print(zigzagLevelOrder(node)) // [[1]]

        node = TreeNode()
        print(zigzagLevelOrder(node)) // []
    }
}
