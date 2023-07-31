class BinaryTreeRightSideView {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard root != nil else { return [] }
        var result: [Int] = []
        var levels: [TreeNode] = [root!]
        while !levels.isEmpty {
            result.append(levels.last!.val)
            var newLevel: [TreeNode] = []
            for n in levels {
                if n.left != nil { newLevel.append(n.left!) }
                if n.right != nil { newLevel.append(n.right!) }
            }
            levels = newLevel
        }
        return result
    }

    func rightSideView2(_ root: TreeNode?) -> [Int] {
        guard root != nil else { return [] }
        var result: [Int] = [root!.val]
        var levels: [TreeNode] = [root!]
        while !levels.isEmpty {
            let count = levels.count
            for _ in 0..<count {
                let n = levels.removeFirst()
                if n.left != nil { levels.append(n.left!) }
                if n.right != nil { levels.append(n.right!) }
            }
            if levels.isEmpty {
                break
            } else {
                result.append(levels.last!.val)
            }
        }
        return result
    }

    func tests() {
        var node = TreeNode(1, TreeNode(2, nil, TreeNode(5)), TreeNode(3, nil, TreeNode(4)))
        print(rightSideView(node)) // [1,3,4]
        
        node = TreeNode(1, nil, TreeNode(3))
        print(rightSideView(node)) // [1,3]
        
        node = TreeNode(1, TreeNode(2, nil, TreeNode(5, TreeNode(6), nil)), TreeNode(3, nil, TreeNode(4)))
        print(rightSideView(node)) // [1,3,4,6]
    }
}
