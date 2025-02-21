class FindElementsinaContaminatedBinaryTree {
    private var set: Set<Int> = []
    init(_ root: TreeNode? = nil) {
        guard let root else { return }
        dfs(root, 0)
    }
    
    func dfs(_ node: TreeNode, _ val: Int) {
        set.insert(val)
        if let left = node.left {
            dfs(left, 2 * val + 1)
        }
        if let right = node.right {
            dfs(right, 2 * val + 2)
        }
    }
    
    func find(_ target: Int) -> Bool {
        set.contains(target)
    }
    
    func tests() {
        var find = FindElementsinaContaminatedBinaryTree(
            TreeNode(-1, nil, -1)
        )
        print(find.find(1)) // false
        print(find.find(2)) // true
        
        find = FindElementsinaContaminatedBinaryTree(
            TreeNode(-1, TreeNode(-1, -1, -1), -1)
        )
        print(find.find(1)) // true
        print(find.find(3)) // true
        print(find.find(5)) // false

        find = FindElementsinaContaminatedBinaryTree(
            TreeNode(-1, nil, TreeNode(-1, TreeNode(-1, -1, nil), nil))
        )
        print(find.find(2)) // true
        print(find.find(3)) // false
        print(find.find(4)) // false
        print(find.find(5)) // true
    }
}

