class ConstructBinaryTreeFromPreorderAndPostorderTraversal {
    func constructFromPrePost(_ preorder: [Int], _ postorder: [Int]) -> TreeNode? {
//        guard preorder.count > 0 else { return nil }
//        let n = preorder.count
//        func helper(preIndex: Int, postStart: Int, postEnd: Int) -> TreeNode? {
//            guard preIndex < n && postStart <= postEnd else { return nil }
//            let root = TreeNode(preorder[preIndex])
//            var nextRootIndex = -1
////            let nextRoot = TreeNode(preorder[preIndex + 1])
//            for i in postStart..<postEnd {
//                if postorder[i] == preorder[preIndex + 1] {
//                    nextRootIndex = i
//                    break
//                }
//            }
//            root.left = helper(
//                preIndex: preIndex + 1,
//                inStart: inStart,
//                inEnd: rootIndex - 1
//            )
//            root.right = helper(
//                preIndex: preIndex + 1 + rootIndex - inStart,
//                inStart: rootIndex + 1,
//                inEnd: inEnd
//            )
//            return root
//        }
//        return helper(preIndex: 0, postStart: 0, postEnd: n-2)
        return nil
    }

    func tests() {
        print(constructFromPrePost([1,2,4,5,3,6,7], [4,5,2,6,7,3,1])) // [1,2,3,4,5,6,7]
        print(constructFromPrePost([1], [1])) // [1]
    }
}
