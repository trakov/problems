class SearchInABinarySearchTree {
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else { return nil }
        guard root.val != val else { return root }
        return val < root.val ?
        searchBST(root.left, val) :
        searchBST(root.right, val)
    }

    func tests() {
        var node = TreeNode(4, TreeNode(2, TreeNode(1), TreeNode(3)), TreeNode(7))
        print(searchBST(node, 2)?.val) // 2
        
        print(searchBST(node, 5)?.val) // nil
    }
}
