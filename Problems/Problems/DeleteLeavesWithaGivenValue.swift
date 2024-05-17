class DeleteLeavesWithaGivenValue {
    func removeLeafNodes(_ root: TreeNode?, _ target: Int) -> TreeNode? {
        guard let root else { return nil }
        let left = removeLeafNodes(root.left, target)
        let right = removeLeafNodes(root.right, target)
        root.left = left
        root.right = right
        if root.val == target && left == nil && right == nil {
            return nil
        }
        return root
    }
    
    func tests() {
        var root: TreeNode?
        root = removeLeafNodes(
            TreeNode(1,TreeNode(2,2,nil),TreeNode(3,2,4)),
            2)
        print(root)
        
        root = removeLeafNodes(
            TreeNode(1,TreeNode(3,3,2),3),
            3)
        print(root)
        
        root = removeLeafNodes(
            TreeNode(1,TreeNode(2,TreeNode(2,2,nil),nil),nil),
            2)
        print(root)
    }
}

