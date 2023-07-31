class BinaryTreeLevelOrderTraversal {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard root != nil else { return [] }
        var level: [TreeNode] = [root!]
        var result: [[Int]] = []
        while !level.isEmpty {
            var subResult = level.map { $0.val }
            result.append(subResult)
            level = level.reduce([], { $0 + ($1.left != nil ? [$1.left!] : []) + ($1.right != nil ? [$1.right!] : []) })
        }
        
        return result
    }

    func tests() {
        
    }
}
