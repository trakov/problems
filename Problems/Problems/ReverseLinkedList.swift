class ReverseLinkedList {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode?
        var cur = head
        
        while cur != nil {
            let next = cur?.next
            cur?.next = prev
            prev = cur
            cur = next
        }

        return prev
    }

    func tests() {
        print(reverseList(ListNode.list(from: [1,2,3,4,5])))
        print(reverseList(ListNode.list(from: [1,2])))
        print(reverseList(ListNode.list(from: [])))
    }
}
