class RemoveZeroSumConsecutiveNodesFromLinkedList {
    func removeZeroSumSublists(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(0, head)
        var current: ListNode? = dummy
        var prefixSum = 0
        var map: [Int: ListNode] = [:]
        while current != nil {
            prefixSum += current!.val
            if let prev = map[prefixSum] {
                current = prev.next
                var p = prefixSum + current!.val
                while p != prefixSum {
                    map[p] = nil
                    current = current?.next
                    p += current!.val
                }
                prev.next = current?.next
            } else {
                map[prefixSum] = current
            }
            current = current?.next
        }
        return dummy.next
    }
    
    func removeZeroSumSublists2(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(0, head)
        var node: ListNode? = dummy
        while node != nil {
            var sum = 0
            var end = node?.next
            while end != nil {
                sum += end!.val
                if sum == 0 {
                    node?.next = end?.next
                }
                end = end?.next
            }
            node = node?.next
        }
        return dummy.next
    }
    
    func tests() {
        var head: ListNode? = ListNode.list(from: [1,2,-3,3,1])
        print(removeZeroSumSublists(head)) // [3,1]
        //    1, 2,-3, 3, 1
        // 0, 1, 3, 0, 3, 4 // sum = 4
        // 4, 3, 1, 4, 1, 0
        
        head = ListNode.list(from: [1,2,3,-3,4])
        print(removeZeroSumSublists(head)) // [1,2,4]
        
        head = ListNode.list(from: [1,2,3,-3,-2])
        print(removeZeroSumSublists(head)) // [1]
    }
}

