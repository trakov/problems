class FindDuplicateSubtrees {
    func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
        guard root != nil else { return [] }
        var hashMap: [Int: Bool] = [:]
        var result: [TreeNode] = []
        
        func dfs(_ node: TreeNode?) -> Int {
            guard let node = node else { return 0 }
            let hashValue = [node.val, dfs(node.left), dfs(node.right)].hashValue
            if hashMap[hashValue] == true {
                result.append(node)
            }
            hashMap[hashValue] = hashMap[hashValue] == nil
            return hashValue
        }
        
        dfs(root)
        return result
    }
    
    func tests() {
        var node = TreeNode(
            1,
            TreeNode(2, TreeNode(4), nil),
            TreeNode(3, TreeNode(2, TreeNode(4), nil), TreeNode(4)))
        print(findDuplicateSubtrees(node))//.compactMap { $0?.val })
        
        node = TreeNode(2, TreeNode(1), TreeNode(1))
        print(findDuplicateSubtrees(node))//.compactMap { $0?.val })
        
        node = TreeNode(
            2,
            TreeNode(2, TreeNode(3), nil),
            TreeNode(2, TreeNode(3), nil))
        print(findDuplicateSubtrees(node))//.compactMap { $0?.val })
    }
}
