//extension TreeNode: Hashable {
//    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
//        lhs === rhs
//    }
//    
//    public func hash(into hasher: inout Hasher) {
//        hasher.combine(ObjectIdentifier(self))
//    }
//}

class NumberofGoodLeafNodesPairs {
    func countPairs(_ root: TreeNode?, _ distance: Int) -> Int {
        var result = 0
        func dfs(_ node: TreeNode?) -> [Int] {
            guard let node else { return [] }
            if node.left == nil && node.right == nil { return [1] }
            let left = dfs(node.left)
            let right = dfs(node.right)
            for l in left {
                for r in right where l + r <= distance {
                    result += 1
                }
            }
            return (left + right)
                .filter { $0 <= distance }
                .map { $0 + 1 }
        }
        dfs(root)
        return result
    }
    
//    func countPairs2(_ root: TreeNode?, _ distance: Int) -> Int {
//        var graph: [TreeNode: [TreeNode]] = [:]
//        var leaves: Set<TreeNode> = []
//        var queue = [root!]
//        while !queue.isEmpty {
//            var newQueue: [TreeNode] = []
//            for node in queue {
//                if node.left == nil && node.right == nil {
//                    leaves.insert(node)
//                    continue
//                }
//                if let left = node.left {
//                    graph[node, default: []].append(left)
//                    graph[left, default: []].append(node)
//                    newQueue.append(left)
//                }
//                if let right = node.right {
//                    graph[node, default: []].append(right)
//                    graph[right, default: []].append(node)
//                    newQueue.append(right)
//                }
//            }
//            queue = newQueue
//        }
//        var result = 0
//        for node in leaves {
//            var d = 0
//            var queue = [node]
//            var visited: Set<TreeNode> = []
//            while !queue.isEmpty && d <= distance {
//                var newQueue: [TreeNode] = []
//                for n in queue where !visited.contains(n) {
//                    if leaves.contains(n) {
//                        result += 1
//                    }
//                    visited.insert(n)
//                    newQueue.append(contentsOf: graph[n] ?? [])
//                }
//                d += 1
//                queue = newQueue
//            }
//        }
//        
//        return (result - leaves.count) / 2
//    }
    
    func tests() {
        var root = TreeNode(1, TreeNode(2,nil,4), 3)
        print(countPairs(root, 3)) // 1
        
        root = TreeNode(1, TreeNode(2,4,5), TreeNode(3,6,7))
        print(countPairs(root, 3)) // 2
        
        root = TreeNode(100)
        print(countPairs(root, 1)) // 0
    }
}

