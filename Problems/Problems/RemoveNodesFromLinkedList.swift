class RemoveNodesFromLinkedList {
    func removeNodes(_ head: ListNode?) -> ListNode? {
        var node = head
        let dummy: ListNode? = ListNode(0)
        while node != nil {
            let next = node?.next
            node?.next = dummy?.next
            dummy?.next = node
            node = next
        }
        
        node = dummy?.next
        while node?.next != nil {
            if node!.next!.val < node!.val {
                node?.next = node?.next?.next
            } else {
                node = node?.next
            }
        }
        
        node = dummy?.next
        dummy?.next = nil
        while node != nil {
            let next = node?.next
            node?.next = dummy?.next
            dummy?.next = node
            node = next
        }
        
        return dummy?.next
    }
    
    func removeNodes2(_ head: ListNode?) -> ListNode? {
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

