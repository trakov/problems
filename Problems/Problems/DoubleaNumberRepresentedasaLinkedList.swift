class DoubleaNumberRepresentedasaLinkedList {
    func doubleIt(_ head: ListNode?) -> ListNode? {
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

