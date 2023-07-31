class ConstructBinaryTreeFromInorderAndPostorderTraversal {
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        guard inorder.count > 0 else { return nil }
        guard inorder.count > 1 else { return TreeNode(inorder[0]) }
        let count = postorder.count
        let root = TreeNode(postorder[count - 1])
        guard let rootIndex = inorder.firstIndex(of: root.val) else {
            return root
        }
        root.left = buildTree(
            Array(inorder[0..<rootIndex]),
            Array(postorder[0..<rootIndex])
        )
        root.right = buildTree(
            Array(inorder[1 + rootIndex..<count]),
            Array(postorder[rootIndex..<count - 1])
        )
        return root
    }

    func tests() {
        print(buildTree([9,3,15,20,7], [9,15,7,20,3])) // [3,9,20,null,null,15,7]
        print(buildTree([-1], [-1])) // [-1]
    }
}
