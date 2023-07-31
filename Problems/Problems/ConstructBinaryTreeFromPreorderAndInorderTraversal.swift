class ConstructBinaryTreeFromPreorderAndInorderTraversal {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard preorder.count > 0 else { return nil }
        let n = preorder.count
        func helper(preIndex: Int, inStart: Int, inEnd: Int) -> TreeNode? {
            guard preIndex < n && inStart <= inEnd else { return nil }
            let root = TreeNode(preorder[preIndex])
            var rootIndex = -1
            for i in inStart...inEnd {
                if inorder[i] == root.val {
                    rootIndex = i
                    break
                }
            }
            root.left = helper(
                preIndex: preIndex + 1,
                inStart: inStart,
                inEnd: rootIndex - 1
            )
            root.right = helper(
                preIndex: preIndex + 1 + rootIndex - inStart,
                inStart: rootIndex + 1,
                inEnd: inEnd
            )
            return root
        }
        return helper(preIndex: 0, inStart: 0, inEnd: n-1)
    }

    func tests() {
        print(buildTree([3,9,20,15,7], [9,3,15,20,7])) // [3,9,20,null,null,15,7]
        print(buildTree([-1], [-1])) // [-1]
    }
}
