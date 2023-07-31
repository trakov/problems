class SwappingNodesInALinkedList {
    func swapNodes(_ head: ListNode?, _ k: Int) -> ListNode? {
        var n = 0
        var node = head
        var node1 = head
        while node != nil {
            n += 1
            if k == n { node1 = node }
            node = node?.next
        }
        if n - k + 1 == k { return head }
        var i = 1
        if n - k + 1 > k {
            node = node1
            i = k
        } else {
            node = head
        }
        while i < n - k + 1 {
            i += 1
            node = node?.next
        }
        
        let val = node1!.val
        node1?.val = node!.val
        node?.val = val
        return head
    }

    func swapNodes2(_ head: ListNode?, _ k: Int) -> ListNode? {
        var newHead = head
        var n = 0
        var node = head
        var prev1 = head
        while node != nil {
            n += 1
            if k - 1 == n {
                prev1 = node
            }
            node = node?.next
        }
        if n - k + 1 == k {
            return head
        }
        var i = 1
        if n - k + 1 > k - 1 {
            node = prev1
            i = k - 1
        } else {
            node = head
        }
        while i < n - k {
            i += 1
            node = node?.next
        }
        
        let val = prev1?.next?.val
        prev1?.next?.val = node?.next?.val ?? -1
        node?.next?.val = val ?? -1
//        var node1 = prev1?.next
//        var next1 = node1?.next
//        var prev2 = node
//        var node2 = prev2?.next
//        var next2 = node2?.next
//
//        prev1?.next = node2
//        node2?.next = next1
//        prev2?.next = node1
//        node1?.next = next2
        
        return newHead
    }
    
    func tests() {
        print(swapNodes([1,2], 1))
        print(swapNodes([1,2,3], 2))
        print(swapNodes([1,2,3,4,5], 2)) // [1,4,3,2,5]
        print(swapNodes([7,9,6,6,7,8,3,0,9,5], 5)) // [7,9,6,6,8,7,3,0,9,5]
    }
}

