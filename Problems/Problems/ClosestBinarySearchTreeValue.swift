class ClosestBinarySearchTreeValue {
    func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
        guard let root else { return -1 }
        var result = Double(root.val)
        
        func dfs(_ node: TreeNode?) {
            guard let node else { return }
            let val = Double(node.val)
            let diff = val - target
            if abs(diff) < abs(result - target) {
                result = val
            }
            if target < val {
                dfs(node.left)
            } else {
                dfs(node.right)
            }
        }
        dfs(root)
        return Int(result)
    }
    
    func tests() {
        print(closestValue(TreeNode(4,TreeNode(2,1,3),5), 3.714286)) // 4
        print(closestValue(1, 3.714286)) // 1
        print(closestValue(TreeNode(4,TreeNode(2,1,3),5), -3.714286)) // 1
        print(closestValue(TreeNode(4,TreeNode(2,1,3),5), 4.714286)) // 5
        print(closestValue(TreeNode(4,TreeNode(2,1,3),5), 10.714286)) // 5
    }
}

