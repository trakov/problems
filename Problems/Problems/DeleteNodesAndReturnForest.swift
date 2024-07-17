class DeleteNodesAndReturnForest {
    func delNodes(_ root: TreeNode?, _ to_delete: [Int]) -> [TreeNode?] {
        let to_delete = Set(to_delete)
        var result: [TreeNode?] = []
        func process(_ node: TreeNode?) -> TreeNode? {
            guard let node else { return nil }
            node.left = process(node.left)
            node.right = process(node.right)
            if to_delete.contains(node.val) {
                if node.left != nil {
                    result.append(node.left)
                }
                if node.right != nil {
                    result.append(node.right)
                }
                return nil
            }
            return node
        }
        let node = process(root)
        if node != nil {
            result.append(node)
        }
        return result
    }
    
    func tests() {
        var root = TreeNode(1, TreeNode(2,4,5), TreeNode(3,6,7))
        var res = delNodes(root, [3,5])
        print(res) // [[1,2,null,4],[6],[7]]
        
        root = TreeNode(1, TreeNode(2,nil,3), 4)
        res = delNodes(root, [3])
        print(res) // [[1,2,4]]
    }
}

