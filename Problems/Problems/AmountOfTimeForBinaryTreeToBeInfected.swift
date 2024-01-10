class AmountOfTimeForBinaryTreeToBeInfected {
    func amountOfTime(_ root: TreeNode?, _ start: Int) -> Int {
        guard let root = root else { return -1 }
        var graph: [Int: Set<Int>] = [:]
        var level = [root]
        while !level.isEmpty {
            var nextLevel: [TreeNode] = []
            for node in level {
                let kids = [node.left, node.right].compactMap({ $0 })
                graph[node.val, default: []].formUnion(kids.map { $0.val })
                kids.forEach { graph[$0.val, default: []].insert(node.val) }
                nextLevel.append(contentsOf: kids)
            }
            level = nextLevel
        }
        var result = 0
        var values = [start]
        while !values.isEmpty {
            var nextValues: [Int] = []
            for val in values {
                for next in graph[val] ?? [] {
                    nextValues.append(next)
                    graph[next]?.remove(val)
                }
                graph[val] = nil
            }
            values = nextValues
            result += 1
        }
        return result - 1
    }
    
    func tests() {
        var root = TreeNode(
            1,
            TreeNode(5, nil, TreeNode(4, 9, 2)),
            TreeNode(3, 10, 6)
        )
        print(amountOfTime(root, 3)) // 4
        
        root = TreeNode(1)
        print(amountOfTime(root, 1)) // 0
    }
}

