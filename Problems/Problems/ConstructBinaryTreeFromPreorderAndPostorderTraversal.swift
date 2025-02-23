class ConstructBinaryTreeFromPreorderAndPostorderTraversal {
    func constructFromPrePost(_ preorder: [Int], _ postorder: [Int]) -> TreeNode? {
        var preIndex = 0
        var postIndex = 0
        func dfs() -> TreeNode? {
            let root = TreeNode(preorder[preIndex])
            preIndex += 1
            if root.val != postorder[postIndex] {
                root.left = dfs()
            }
            if root.val != postorder[postIndex] {
                root.right = dfs()
            }
            postIndex += 1
            return root
        }
        return dfs()
    }

    func tests() {
        var root = constructFromPrePost([1,2,4,5,3,6,7], [4,5,2,6,7,3,1]) // [1,2,3,4,5,6,7]
        root = constructFromPrePost([1], [1])
    }
}
