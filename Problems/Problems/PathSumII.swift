class PathSumII {
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        func dfs(_ node: TreeNode?, _ sum: Int, _ path: inout [Int]) -> [[Int]] {
            guard let node else { return [] }
            path.append(node.val)
            defer {
                path.removeLast()
            }
            let sum = sum - node.val
            if node.left == nil && node.right == nil {
                if sum == 0 { return [path] }
                return []
            }
            return dfs(node.left, sum, &path) + dfs(node.right, sum, &path)
        }
        var path: [Int] = []
        return dfs(root, targetSum, &path)
    }

    func pathSum2(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        var result: [[Int]] = []
        guard let root else { return result }
        func dfs(_ node: TreeNode?, _ sum: Int, _ path: inout [Int]) {
            guard let node else { return }
            if node.left == nil && node.right == nil {
                if sum == targetSum {
                    result.append(path)
                }
                return
            }
            if let left = node.left {
                path.append(left.val)
                dfs(left, sum + left.val, &path)
                path.removeLast()
            }
            if let right = node.right {
                path.append(right.val)
                dfs(right, sum + right.val, &path)
                path.removeLast()
            }
        }
        var path: [Int] = [root.val]
        dfs(root, root.val, &path)
        return result
    }
    
    func tests() {
        var root = TreeNode(
            5,
            TreeNode(
                4, TreeNode(11, TreeNode(7), TreeNode(2)), nil
            ),
            TreeNode(
                8, TreeNode(13), TreeNode(4, TreeNode(5), TreeNode(1))
            )
        )
        print(pathSum(root, 22)) // [[5,4,11,2],[5,8,4,5]]
        
        root = TreeNode(1, TreeNode(2), TreeNode(3))
        print(pathSum(root, 5)) // []

        root = TreeNode(1, TreeNode(2), nil)
        print(pathSum(root, 0)) // []
    }
}

