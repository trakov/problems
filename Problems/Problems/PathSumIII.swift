class PathSumIII {
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> Int {
        var count = 0
        pathSumRec(root, targetSum, array: [], count: &count)
        return count
    }
    
    func pathSumRec(_ root: TreeNode?, _ targetSum: Int, array: [Int], count: inout Int) {
        guard let root = root else { return }
        var arr = array.map {
            let newNum = $0 + root.val
            if newNum == targetSum { count += 1 }
            return newNum
        }
        if root.val == targetSum { count += 1 }
        arr.append(root.val)
        pathSumRec(root.left, targetSum, array: arr, count: &count)
        pathSumRec(root.right, targetSum, array: arr, count: &count)
    }

    func tests() {
        var tree = TreeNode(
            10,
            TreeNode(
                5, TreeNode(3, TreeNode(3), TreeNode(-2)),TreeNode(2, TreeNode(1), nil)
            ),
            TreeNode(
                -3, TreeNode(11), nil
            )
        )
        print(pathSum(tree, 8)) // 3

        print(pathSum(tree, 3)) // 3

        tree = TreeNode(
            5,
            TreeNode(
                4, TreeNode(11, TreeNode(7), TreeNode(2)), nil
            ),
            TreeNode(
                8, TreeNode(13), TreeNode(4, TreeNode(5), TreeNode(1))
            )
        )
        print(pathSum(tree, 22)) // 3
    }
}
