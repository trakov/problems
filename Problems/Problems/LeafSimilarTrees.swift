class LeafSimilarTrees {
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        var s1: [TreeNode] = []
        var s2: [TreeNode] = []
        var n1 = root1
        var n2 = root2
        var leafValues: [Int] = []
        while n1 != nil || !s1.isEmpty {
            while n1 != nil {
                s1.append(n1!)
                n1 = n1?.left
            }
            n1 = s1.removeLast()
            if n1?.left == nil && n1?.right == nil {
                leafValues.append(n1!.val)
            }
            n1 = n1?.right
        }
        while n2 != nil || !s2.isEmpty {
            while n2 != nil {
                s2.append(n2!)
                n2 = n2?.left
            }
            n2 = s2.removeLast()
            if n2?.left == nil && n2?.right == nil {
                guard !leafValues.isEmpty else { return false }
                guard leafValues.removeFirst() == n2!.val else { return false }
            }
            n2 = n2?.right
        }
        return leafValues.isEmpty
    }

    func tests() {
        var root1 = TreeNode(
            3,
            TreeNode(5, TreeNode(6), TreeNode(2, TreeNode(7), TreeNode(4))),
            TreeNode(1, TreeNode(9), TreeNode(8))
        )
        var root2 = TreeNode(
            3,
            TreeNode(5, TreeNode(6), TreeNode(7)),
            TreeNode(1, TreeNode(4), TreeNode(2, TreeNode(9), TreeNode(8)))
        )
        print(leafSimilar(root1, root2))
        
        root1 = TreeNode(
            1,
            TreeNode(2, nil, nil),
            TreeNode(3, nil, nil)
        )
        root2 = TreeNode(
            1,
            TreeNode(3, nil, nil),
            TreeNode(2, nil, nil)
        )
        print(leafSimilar(root1, root2))
    }
}
