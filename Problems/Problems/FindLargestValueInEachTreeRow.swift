class FindLargestValueInEachTreeRow {
    func largestValues(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        guard root != nil else { return result }
        var level = [root!]
        while !level.isEmpty {
            var nextLevel: [TreeNode] = []
            var val = Int.min
            for node in level {
                val = max(val, node.val)
                if let left = node.left { nextLevel.append(left) }
                if let right = node.right { nextLevel.append(right) }
            }
            level = nextLevel
            result.append(val)
        }
        return result
    }
    
    func tests() {
        var tree = TreeNode(1, TreeNode(3, 5, 3), TreeNode(2, nil, 9))
        print(largestValues(tree)) // [1,3,9]
        
        tree = TreeNode(1, TreeNode(3, 5, 3), TreeNode(2))
        print(largestValues(tree)) // [1,3,5]
    }
}

