class MiddleOfTheLinkedList {
    func middleNode(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head
        while fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }

    func middleNode2(_ head: ListNode?) -> ListNode? {
        var node = head
        var middle = head
        var i = 0
        while node != nil {
            if i % 2 != 0 {
                middle = middle?.next
            }
            node = node?.next
            i += 1
        }
        return middle
    }

    func tests() {
        var node = ListNode.list(from: [1,2,3,4,5])
        print(middleNode(node)) // 3,4,5
        
        node = ListNode.list(from: [1,2,3,4,5,6])
        print(middleNode(node)) // 4,5,6

    }
}
