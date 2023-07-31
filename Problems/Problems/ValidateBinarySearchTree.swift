class ValidateBinarySearchTree {
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        return isValid(root, maxValue: Int.max, minValue: Int.min)
    }

    func isValid(_ node: TreeNode?, maxValue: Int, minValue: Int) -> Bool {
        guard let node = node else { return true }
        if let left = node.left?.val {
            guard left < node.val && left > minValue else {
                print(left)
                return false
            }
        }
        if let right = node.right?.val {
            guard right > node.val && right < maxValue else {
                print(right)
                return false
            }
        }
        return isValid(node.left, maxValue: node.val, minValue: minValue) &&
        isValid(node.right, maxValue: maxValue, minValue: node.val)
    }
    
    func tests() {
        var tree = TreeNode(2, TreeNode(1), TreeNode(3))
        print(isValidBST(tree))// true
        
        tree = TreeNode(5, TreeNode(1), TreeNode(4, TreeNode(3), TreeNode(6)))
        print(isValidBST(tree)) // false
        
        tree = TreeNode(
            5,
            TreeNode(3, TreeNode(1), TreeNode(4)),
            TreeNode(9, TreeNode(7), TreeNode(10))
        )
        print(isValidBST(tree)) // true
        
        tree = TreeNode(
            5,
            TreeNode(3, TreeNode(1), TreeNode(4)),
            TreeNode(9, TreeNode(7, TreeNode(-1), TreeNode(8)), TreeNode(10))
        )
        print(isValidBST(tree)) // false
    }
}
