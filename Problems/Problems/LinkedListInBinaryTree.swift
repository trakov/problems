class LinkedListInBinaryTree {
    func isSubPath(_ head: ListNode?, _ root: TreeNode?, _ isHead: Bool = true) -> Bool {
        guard let head = head else { return true }
        guard let root = root else { return false }
        return head.val == root.val
        && (isSubPath(head.next, root.right, false) || isSubPath(head.next, root.left, false))
        || isHead && (isSubPath(head, root.right) || isSubPath(head, root.left))
    }
    
    func isSubPath2(_ head: ListNode?, _ root: TreeNode?) -> Bool {
        guard root != nil && head != nil else { return true }
        
        func bfs(treeNode: TreeNode) -> Bool {
            var queue = [treeNode]
            var node = head
            while node != nil && !queue.isEmpty {
                var newQueue: [TreeNode] = []
                for q in queue {
                    if q.left != nil && q.left?.val == node?.next?.val { newQueue.append(q.left!) }
                    if q.right != nil && q.right?.val == node?.next?.val { newQueue.append(q.right!) }
                }
                queue = newQueue
                node = node?.next
            }
            return node == nil
        }
        
        var queue = [root!]
        while !queue.isEmpty {
            var newQueue: [TreeNode] = []
            for q in queue {
                if q.val == head?.val && bfs(treeNode: q) {
                    return true
                }
                if q.left != nil { newQueue.append(q.left!) }
                if q.right != nil { newQueue.append(q.right!) }
            }
            queue = newQueue
        }
        
        return false
    }
    
    func tests() {
//        [4,2,2,null,2,2,null,1,null,6,2,null,null,null,null,1,8]

        var root = TreeNode(
            4,
            TreeNode(2, nil, TreeNode(2, 1, nil)),
            TreeNode(2, TreeNode(2, 6, TreeNode(2, 1, 8)), nil)
        )
        print(isSubPath([4,2,8], root)) // false
        
        root = TreeNode(
            1,
            TreeNode(4, nil, TreeNode(2, 1, nil)),
            TreeNode(4, TreeNode(2, 6, TreeNode(8, 1, 3)), nil)
        )
        print(isSubPath([4,2,8], root)) // true
        
        print(isSubPath([1,4,2,6], root)) // true

        print(isSubPath([1,4,2,6,8], root)) // false
    }
}

