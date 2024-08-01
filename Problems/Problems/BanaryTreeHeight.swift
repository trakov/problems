class BanaryTreeHeight {
    func height(_ root: TreeNode?) -> Int {
        guard let root else { return -1 }
        return max(
            height(root.left), height(root.right)
        ) + 1
    }
    
    func tests() {
        print(height(TreeNode(5))) // 0
        print(height(TreeNode(1, 2, 3))) // 1
        print(height(TreeNode(1, TreeNode(2,3,nil), 4))) // 2
        print(height(TreeNode(
            1, TreeNode(2,3,nil), 4))) // 2
    }
}

