class KthSmallestElementInABST {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var node = root
        var stack: [TreeNode] = []
        var k = k
        
        while node != nil || !stack.isEmpty {
            while node != nil {
                stack.append(node!)
                node = node?.left
            }
            node = stack.removeLast()
            if k == 1 {
                return node!.val
            }
            k -= 1
            node = node?.right
        }
        
        return -1
    }

    func tests() {
        var node = TreeNode(3, TreeNode(1, nil, TreeNode(2)), TreeNode(4))
        print(kthSmallest(node, 1)) // 1
        
        node = TreeNode(
            5,
            TreeNode(3, TreeNode(2, TreeNode(1), nil), TreeNode(4)),
            TreeNode(6))
        print(kthSmallest(node, 1)) // 1
    }
}
