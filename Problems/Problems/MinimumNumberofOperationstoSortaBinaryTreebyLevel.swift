class MinimumNumberofOperationstoSortaBinaryTreebyLevel {
    func minimumOperations(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        var queue = [root]
        var result = 0
        while !queue.isEmpty {
            let levelSize = queue.count
            var levelValues = Array(repeating: 0, count: levelSize)
            for i in 0..<levelSize {
                let node = queue.removeFirst()
                levelValues[i] = node.val
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }
            }
            result += getMinSwaps(levelValues)
        }
        return result
    }

    func getMinSwaps(_ original: [Int]) -> Int {
        var swaps = 0
        var original = original
        let target = original.sorted()
        var pos: [Int: Int] = [:]
        for (i, num) in original.enumerated() {
            pos[num] = i
        }
        for i in 0..<original.count where original[i] != target[i] {
            swaps += 1
            let curPos = pos[target[i]]!
            pos[original[i]] = curPos
            original[curPos] = original[i]
        }
        return swaps
    }
    
    func tests() {
        var tree = TreeNode(
            1,
            TreeNode(4, 7, 6),
            TreeNode(3, TreeNode(8, 9, nil), TreeNode(5, 10, nil))
        )
        print(minimumOperations(tree)) // 3
        tree = TreeNode(1, TreeNode(3, 7, 6), TreeNode(2, 5, 4))
        print(minimumOperations(tree)) // 3
    }
}

