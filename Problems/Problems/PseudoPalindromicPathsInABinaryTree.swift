class PseudoPalindromicPathsInABinaryTree {
    func pseudoPalindromicPaths (_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        func helper(node: TreeNode, map: [Int: Int]) -> Int {
            var map = map
            if map[node.val] != nil {
                map[node.val] = nil
            } else {
                map[node.val] = 1
            }
            guard node.left != nil || node.right != nil else {
                return map.count > 1 ? 0 : 1
            }
            return (node.left == nil ? 0 : helper(node: node.left!, map: map))
            + (node.right == nil ? 0 : helper(node: node.right!, map: map))
        }
        return helper(node: root, map: [:])
    }
    
    func tests() {
        var tree: TreeNode?
        tree = TreeNode(2, TreeNode(3, 3, 1), TreeNode(1, nil, 1))
        print(pseudoPalindromicPaths(tree)) // 2
        
        tree = TreeNode(2, TreeNode(1, 1, TreeNode(3, nil, 1)), 1)
        print(pseudoPalindromicPaths(tree)) // 1
        
        tree = TreeNode(9)
        print(pseudoPalindromicPaths(tree)) // 1
        
        tree = TreeNode(
            8,
            TreeNode(
                8,
                7,
                TreeNode(
                    7,
                    TreeNode(2, nil, TreeNode(8, nil, 1)),
                    TreeNode(4, nil, 7))
            ),
            nil)
        print(pseudoPalindromicPaths(tree)) // 2
    }
}

