class VerticalOrderTraversalOfABinaryTree {
    func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
        guard root != nil else { return [] }
        var l = 0
        var r = 0
        var level = [(root!, 0)]
        var map: [Int: [Int]] = [0: [root!.val]]
        while !level.isEmpty {
            var next: [(TreeNode, Int)] = []
            var nextMap: [Int: [Int]] = [:]
            for (node, i) in level {
                if let left = node.left {
                    next.append((left, i - 1))
                    l = min(l, i - 1)
                    nextMap[i - 1, default: []].append(left.val)
                }
                if let right = node.right {
                    next.append((right, i + 1))
                    r = max(r, i + 1)
                    nextMap[i + 1, default: []].append(right.val)
                }
            }
            for (i, values) in nextMap {
                map[i, default: []].append(contentsOf: values.sorted())
            }
            level = next
        }
        var result = Array(repeating: [Int](), count: r - l + 1)
        for i in l...r {
            result[i - l] = map[i]!
        }
        return result
    }
    
    func tests() {
        var root = TreeNode(
            3,
            9,
            TreeNode(20, 15, 7)
        )
        print(verticalTraversal(root)) // [[9],[3,15],[20],[7]]
        
        root = TreeNode(
            1,
            TreeNode(2, 4, 5),
            TreeNode(3, 6, 7)
        )
        print(verticalTraversal(root)) // [[4],[2],[1,5,6],[3],[7]]
        
        root = TreeNode(
            1,
            TreeNode(2, 4, 6),
            TreeNode(3, 5, 7)
        )
        print(verticalTraversal(root)) // [[4],[2],[1,5,6],[3],[7]]
    }
}

