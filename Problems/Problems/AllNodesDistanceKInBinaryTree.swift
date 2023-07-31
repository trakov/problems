class AllNodesDistanceKInBinaryTree {
    func childs(_ root: TreeNode?, exceptChild: TreeNode?, distance: Int) -> [Int] {
        guard root != nil else { return [] }
        guard distance > 0 else { return [root!.val] }
        var queue = [root?.left, root?.right].compactMap { $0 }
        queue.removeAll(where: { $0 === exceptChild })
        var i = 1
        while i < distance && !queue.isEmpty {
            let count = queue.count
            for i in 0..<count {
                let node = queue[i]
                if node.left != nil { queue.append(node.left!) }
                if node.right != nil { queue.append(node.right!) }
            }
            queue.removeFirst(count)
            i += 1
        }
        return queue.map { $0.val }
    }
    
    func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ k: Int) -> [Int] {
        guard root != nil && target != nil else { return [] }
        guard k > 0 else { return [target!.val] }
        var result = childs(target, exceptChild: nil, distance: k)
        guard root !== target else {
            return result
        }
        var map: [Int: TreeNode?] = [root!.val: nil] // node.val: parentNode
        var queue = [root!]
        var targetFound = false
        while !queue.isEmpty && !targetFound {
            let count = queue.count
            for i in 0..<count {
                let node = queue[i]
                if node.left != nil {
                    map[node.left!.val] = node
                    if node.left === target {
                        targetFound = true
                        break
                    }
                    queue.append(node.left!)
                }
                if node.right != nil {
                    map[node.right!.val] = node
                    if node.right === target {
                        targetFound = true
                        break
                    }
                    queue.append(node.right!)
                }
            }
            queue.removeFirst(count)
        }
        
        var i = k - 1
        var nextRoot = map[target!.val]!
        var exceptChild = target
        while i >= 0 {
            result.append(contentsOf: childs(nextRoot, exceptChild: exceptChild, distance: i))
            i -= 1
            guard let nextRootVal = nextRoot?.val, nextRootVal != -1 else {
                break
            }
            exceptChild = nextRoot
            nextRoot = map[nextRootVal]!
        }
        
        return result
    }
    
    func tests() {
        var target = TreeNode(5, 6, TreeNode(2, 7, 4))
        var root = TreeNode(3, target, TreeNode(1, 0, 8))
        print(distanceK(root, target, 2)) // [7,4,1]

        let root2 = TreeNode(9, root, TreeNode(10, 11, 12))
        print(distanceK(root2, target, 2)) // [7,4,1,9]

        print(distanceK(root2, target, 3)) // [0,8,10]
        
        target = TreeNode(1, nil, TreeNode(2, nil, 3))
        root = TreeNode(0, nil, target)
        print(distanceK(root, target, 2))
    }
}

