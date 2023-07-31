class RemoveNthNodeFromEndOfList {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        return slowFast(head, n)
        guard head != nil else { return nil }
        var nodes: [ListNode] = []
        var node = head
        while node != nil {
            nodes.append(node!)
            node = node?.next
        }
        guard nodes.count - n - 1 >= 0 else { return head?.next }
        let prevOfNodeToRemove = nodes[nodes.count - n - 1]
        prevOfNodeToRemove.next = prevOfNodeToRemove.next?.next
        return head
    }

    func slowFast(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard head != nil else { return nil }
        if head?.next == nil && n == 1 { return nil }
        var k = 1
        var slow = head
        var fast = head?.next
        while fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            k += 1
        }
        var count = 2 * k
        if fast?.next != nil {
            count += 1
        }
        let prevToDelete = count - n - 1
        if prevToDelete == -1 { return head?.next }
        k = 0
        slow = head
        while k != prevToDelete {
            slow = slow?.next
            k += 1
        }
        slow?.next = slow?.next?.next
        return head
    }
    
    func tests() {
        var node = ListNode.list(from: [1,2,3,4,5])
        print(removeNthFromEnd(node, 2)) // [1,2,3,5]
        
        node = ListNode.list(from: [1])
        print(removeNthFromEnd(node, 1)) // []
        
        node = ListNode.list(from: [1,2])
        print(removeNthFromEnd(node, 1)) // [1]
    }
}
