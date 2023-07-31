class MaximumLevelSumOfABinaryTree {
    func maxLevelSum(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var level = [root]
        var result = 1
        var currentLevel = 1
        var maxSum = Int.min
        
        while !level.isEmpty {
            let count = level.count
            var sum = 0
            for i in 0..<count {
                let node = level[i]
                sum += node.val
                if let left = node.left {
                    level.append(left)
                }
                if let right = node.right {
                    level.append(right)
                }
            }
            level.removeFirst(count)
            if sum > maxSum {
                maxSum = sum
                result = currentLevel
            }
            currentLevel += 1
        }
        return result
    }
    
    func tests() {
        print(maxLevelSum(TreeNode(
            1,
            TreeNode(7, 7, -8),
            0
        ))) // 2
        print(maxLevelSum(TreeNode(
            -100,
             TreeNode(-200, -20, -5),
             TreeNode(-300, -10, nil) // 3
        ))) //
    }
}

