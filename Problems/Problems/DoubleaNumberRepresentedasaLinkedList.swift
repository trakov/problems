class DoubleaNumberRepresentedasaLinkedList {
    func doubleIt(_ head: ListNode?) -> ListNode? {
        guard var head else { return nil }
        if (head.val * 2) / 10 > 0 {
            head = ListNode(0, head)
        }
        var node: ListNode? = head
        while node != nil {
            node?.val = (node!.val * 2) % 10
            if let val = node?.next?.val, (val * 2) / 10 > 0 {
                node?.val += 1
            }
            node = node?.next
        }
        return head
    }
    
    func doubleIt2(_ head: ListNode?) -> ListNode? {
        let rev = reverse(head)
        
        var node = rev
        var tail = rev
        var one = 0
        while node != nil {
            let val = node!.val * 2 + one
            node?.val = val % 10
            one = val / 10
            tail = node
            node = node?.next
        }
        if one > 0 {
            tail?.next = ListNode(one)
            tail = tail?.next
        }
        
        return reverse(rev)
    }
    
    func reverse(_ head: ListNode?) -> ListNode? {
        var prev: ListNode?
        var node = head
        while node != nil {
            let next = node?.next
            node?.next = prev
            prev = node
            node = next
        }
        return prev
    }

    // 9    9     9    (1)
    // 8(1) 9(1)  9(1)  1
    
    func tests() {
        print(doubleIt([0])) // [0]
        print(doubleIt([1])) // [2]
        print(doubleIt([1,8,9])) // [3,7,8]
        print(doubleIt([9,9,9])) // [1,9,9,8]
    }
}

