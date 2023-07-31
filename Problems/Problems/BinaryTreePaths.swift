class BinaryTreePaths {
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        guard let root = root else { return [] }
        return fillValues(node: root, results: [])
    }
    
    func fillValues(node: TreeNode, results: [String]) -> [String] {
        let strings = results.isEmpty ? ["\(node.val)"] : (results.map { $0 + "->\(node.val)" })
        guard node.left != nil || node.right != nil else { return strings }
        return
        (node.left != nil ? fillValues(node: node.left!, results: strings) : []) +
        (node.right != nil ? fillValues(node: node.right!, results: strings) : [])
    }

    func tests() {
        var root = TreeNode(1, TreeNode(2, TreeNode(4, nil, nil), TreeNode(5, nil, nil)), TreeNode(3, nil, nil))
        
        print(binaryTreePaths(root)) // ["1->2->5","1->3"]
        
    }
}
