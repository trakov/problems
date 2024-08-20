class BinaryTreeVerticalOrderTraversal {
    func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
        guard let root else { return [] }
        var left = 0
        var right = 0
        var level = [(root, 0)]
        var map: [Int: [Int]] = [:]
        
        while !level.isEmpty {
            var next: [(TreeNode, Int)] = []
            
            for (node, i) in level {
                left = min(left, i)
                right = max(right, i)
                map[i, default: []].append(node.val)
                if let l = node.left {
                    next.append((l, i - 1))
                }
                if let r = node.right {
                    next.append((r, i + 1))
                }
            }
            
            level = next
        }
        
        var result = Array(repeating: [Int](), count: (right - left + 1))
        for i in left...right {
            result[i - left] = map[i]!
        }
        return result
    }

    
    func tests() {
        print(verticalTraversal(TreeNode(3, 9, TreeNode(20,15,7))))
        // [[9],[3,15],[20],[7]]
        print(verticalTraversal(TreeNode(3, TreeNode(9,4,0), TreeNode(8,1,7))))
        // [[4],[9],[3,0,1],[8],[7]]
        print(verticalTraversal(TreeNode(
            3,
            TreeNode(9,4,TreeNode(0,nil,2)),
            TreeNode(8,TreeNode(1,5,nil),7)
        )))
        // [[4],[9,5],[3,0,1],[8,2],[7]]
    }
}

