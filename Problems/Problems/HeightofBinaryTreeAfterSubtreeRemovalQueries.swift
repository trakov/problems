class HeightofBinaryTreeAfterSubtreeRemovalQueries {
    func treeQueries(_ root: TreeNode?, _ queries: [Int]) -> [Int] {
        let m = queries.count
        var resultMap: [Int: Int] = [:]
        var heightCache: [Int: Int] = [:]
        
        func height(_ node: TreeNode?) -> Int {
            guard let node else { return -1 }
            if let h = heightCache[node.val] {
                return h
            }
            let h = 1 + max(height(node.left), height(node.right))
            heightCache[node.val] = h
            return h
        }

        func dfs(_ node: TreeNode?, _ depth: Int, _ maxVal: Int) {
            guard let node else { return }
            resultMap[node.val] = maxVal
            dfs(node.left, depth + 1, max(
                maxVal, depth + 1 + height(node.right)
            ))
            dfs(node.right, depth + 1, max(
                maxVal, depth + 1 + height(node.left)
            ))
        }

        dfs(root, 0, 0)

        var result = Array(repeating: 0, count: m)
        for (i, query) in queries.enumerated() {
            result[i] = resultMap[query]!
        }
        return result
    }
    
    func tests() {
        print(treeQueries(TreeNode(
            1, TreeNode(3, 2, nil), TreeNode(4, 6, TreeNode(5, nil, 7))
        ), [4])) // [2]
        print(treeQueries(TreeNode(
            5, TreeNode(8, TreeNode(2, 4, 6), 1), TreeNode(9, 3, 7)
        ), [3,2,4,8])) // [3,2,3,2]
    }
}

