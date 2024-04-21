class LongestUnivaluePath {
    func longestUnivaluePath(_ root: TreeNode?) -> Int {
        var result = 0
        func helper(_ node: TreeNode?, _ val: Int) -> Int {
            guard let node = node else { return 0 }
            let left = helper(node.left, node.val)
            let right = helper(node.right, node.val)
            result = max(result, left + right)
            return node.val == val ? (max(left, right) + 1) : 0
        }
        helper(root, Int.max)
        return result
    }
    
    func tests() {
        var root: TreeNode? = TreeNode(5, TreeNode(4,1,1), TreeNode(5,nil,5))
        print(longestUnivaluePath(root)) // 2
        
        root = TreeNode(1, TreeNode(4,4,4), TreeNode(5,nil,5))
        print(longestUnivaluePath(root)) // 2
    }
}

