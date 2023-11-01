class FindModeInBinarySearchTree {
    func findMode(_ root: TreeNode?) -> [Int] {
        var map: [Int: Int] = [:]
        func dfs(_ node: TreeNode?) {
            guard let val = node?.val else { return }
            map[val, default: 0] += 1
            dfs(node?.left)
            dfs(node?.right)
        }
        dfs(root)
        var maxFreq = 0
        for (_, freq) in map {
            maxFreq = max(maxFreq, freq)
        }
        var result: [Int] = []
        for (val, freq) in map where freq == maxFreq {
            result.append(val)
        }
        return result
    }
    
    func tests() {
        var root = TreeNode(1, nil, TreeNode(2, 2, nil))
        print(findMode(root)) // [2]
        root = TreeNode(0)
        print(findMode(root)) // [0]
        root = TreeNode(7, TreeNode(4, 4, nil), TreeNode(8, 8, 10))
        print(findMode(root)) // [4, 8]
    }
}

