class StepByStepDirectionsFromaBinaryTreeNodetoAnother {
    func getDirections(_ root: TreeNode?, _ startValue: Int, _ destValue: Int) -> String {
        var startPath: [Character] = []
        var destPath: [Character] = []
        findPath(root, startValue, &startPath)
        findPath(root, destValue, &destPath)
        var count = 0
        while (
            count < startPath.count &&
            count < destPath.count &&
            startPath[count] ==
            destPath[count]
        ) {
            count += 1
        }
        var result = String(repeating: "U", count: startPath.count - count)
        for i in count..<destPath.count {
            result.append(destPath[i])
        }
        return result
    }

    @discardableResult
    func findPath(_ node: TreeNode?, _ target: Int, _ path: inout [Character]) -> Bool {
        guard let node else { return false }
        if node.val == target { return true }
        path.append("L")
        if findPath(node.left, target, &path) {
            return true
        }
        path.removeLast()
        path.append("R")
        if findPath(node.right, target, &path) {
            return true
        }
        path.removeLast()
        return false
    }
    
    // MLE
    func getDirections2(_ root: TreeNode?, _ startValue: Int, _ destValue: Int) -> String {
        let n = nodesCount(node: root)
        var nodes = Array(repeating: [Int: String](), count: n + 1)
        var queue = [root!]
        while !queue.isEmpty {
            var newQueue: [TreeNode] = []
            for node in queue {
                if let left = node.left {
                    nodes[node.val][left.val] = "L"
                    nodes[left.val][node.val] = "U"
                    newQueue.append(left)
                }
                if let right = node.right {
                    nodes[node.val][right.val] = "R"
                    nodes[right.val][node.val] = "U"
                    newQueue.append(right)
                }
            }
            queue = newQueue
        }
        var res = ""
        func findDestValue(_ node: Int, _ visited: Set<Int>, _ result: String) {
            guard !visited.contains(node) else { return }
            if node == destValue { res = result; return }
            for (next, dir) in nodes[node] {
                findDestValue(next, visited.union([node]), result.appending(dir))
            }
        }
        var visited: Set<Int> = []
        findDestValue(startValue, visited, "")
        return res
    }

    func nodesCount(node: TreeNode?) -> Int {
        guard let node else { return 0 }
        return nodesCount(node: node.left) + nodesCount(node: node.right) + 1
    }

    func tests() {
        var root = TreeNode(5, TreeNode(1, 3, nil), TreeNode(2, 6, 4))
        print(getDirections(root, 3, 6)) // UURL
        root = TreeNode(2, 1, nil)
        print(getDirections(root, 2, 1)) // L
    }
}

