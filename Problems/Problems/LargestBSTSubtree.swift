class LargestBSTSubtree {
    func largestBSTSubtree(_ root: TreeNode?) -> Int {
        func dfs(_ node: TreeNode?) -> (minVal: Int, maxVal: Int, size: Int) {
            guard let node else { return (Int.max, Int.min, 0) }
            let left = dfs(node.left)
            let right = dfs(node.right)
            if node.val > left.maxVal && node.val < right.minVal {
                return (
                    min(node.val, left.minVal),
                    max(node.val, right.maxVal),
                    left.size + right.size + 1
                )
            } else {
                return (Int.min, Int.max, max(left.size, right.size))
            }
        }
        return dfs(root).size
    }

    func largestBSTSubtree2(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        
        func bstCount(_ node: TreeNode?, _ minVal: Int, _ maxVal: Int) -> Int? {
            guard let node else { return 0 }
            guard node.val > minVal && node.val < maxVal else { return nil }
            guard let left = bstCount(node.left, minVal, node.val) else {
                return nil
            }
            guard let right = bstCount(node.right, node.val, maxVal) else {
                return nil
            }
            return left + right + 1
        }
        
        var level = [root]
        var result = 1
        while !level.isEmpty {
            var next: [TreeNode] = []
            for node in level {
                if let count = bstCount(node, Int.min, Int.max) {
                    result = max(result, count)
                } else {
                    if let left = node.left { next.append(left) }
                    if let right = node.right { next.append(right) }
                }
            }
            level = next
        }
        return result
    }
    
    func tests() {
        var root = TreeNode(10, TreeNode(5,1,8), TreeNode(15,nil,7))
        print(largestBSTSubtree(root)) // 3
        
//        root =
//        print(largestBSTSubtree(root)) // 3
    }
}

