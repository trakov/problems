class TwoSumIVInputIsABST {
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        guard root != nil else { return false }
        var stack: [TreeNode] = []
        var numbers: [Int: Int] = [:]
        var node = root
        while !stack.isEmpty || node != nil {
            while node != nil {
                stack.append(node!)
                node = node?.left
            }
            node = stack.removeLast()
            if numbers[k - node!.val] == 1 {
                return true
            }
            numbers[node!.val] = 1
            node = node?.right
        }
        return false
    }

    func tests() {
        var node = TreeNode(
            5,
            TreeNode(3, TreeNode(2), TreeNode(4)),
            TreeNode(6, nil, TreeNode(7))
        )
        print(findTarget(node, 9)) // true
//        node = TreeNode()
        print(findTarget(node, 28)) // false
    }
}
