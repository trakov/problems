class RemoveNodesFromLinkedList {
    func removeNodes(_ head: ListNode?) -> ListNode? {
        var stack: [ListNode] = []
        var node = head
        while node != nil {
            while !stack.isEmpty && stack.last!.val < node!.val {
                stack.removeLast()
            }
            stack.append(node!)
            node = node?.next
        }
        var dummy = ListNode(0)
        while let node = stack.popLast() {
            node.next = dummy.next
            dummy.next = node
        }
        return dummy.next
    }
    
    func tests() {
        print(removeNodes([5,2,13,3,8])) // [13,8]
        print(removeNodes([1,1,1,1])) // [1,1,1,1]
    }
}

