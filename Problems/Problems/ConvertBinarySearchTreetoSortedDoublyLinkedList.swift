class ConvertBinarySearchTreetoSortedDoublyLinkedList {
    //in place
    func convertToDoublyLinkedList(_ root: TreeNode?) -> TreeNode? {
        guard let root else { return nil }
        var head: TreeNode?
        var n: TreeNode?
        var stack: [TreeNode] = []
        var node: TreeNode? = root
        
        while node != nil || !stack.isEmpty {
            while node != nil {
                stack.append(node!)
                node = node?.left
            }
            node = stack.removeLast()

            node?.left = n
            if head == nil {
                head = node
            } else {
                n?.right = node
            }
            n = node

            node = node?.right
        }
        head?.left = n
        n?.right = head
        return head
    }

    // not in place
    func convertToDoublyLinkedList2(_ root: TreeNode?) -> TreeNode? {
        guard let root else { return nil }
        var head: TreeNode?
        var n: TreeNode?
        var stack: [TreeNode] = []
        var node: TreeNode? = root
        
        while node != nil || !stack.isEmpty {
            while node != nil {
                stack.append(node!)
                node = node?.left
            }
            node = stack.removeLast()

            let cur = TreeNode(node!.val, n, nil)
            if head == nil {
                head = cur
            } else {
                n?.right = cur
            }
            n = cur

            node = node?.right
        }
        head?.left = n
        n?.right = head
        return head
    }
    
    func tests() {
        var root = TreeNode(4, TreeNode(2, 1, 3), 5)
        let head = convertToDoublyLinkedList(root)
        print(head) // [1,2,3,4,5]
    }
}

