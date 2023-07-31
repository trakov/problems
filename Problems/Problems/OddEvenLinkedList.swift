class OddEvenLinkedList {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        var lastOdd = head
        let firstEven = head?.next
        var evenNode = head?.next
        while lastOdd != nil && evenNode != nil {
            lastOdd?.next = lastOdd?.next?.next
            if lastOdd?.next != nil {
                lastOdd = lastOdd?.next
            }
            evenNode?.next = evenNode?.next?.next
            evenNode = evenNode?.next
        }
        
        lastOdd?.next = firstEven
        return head
    }

    func tests() {
        var arr: [Int] = []
        var node = ListNode.list(from: arr)
        print(oddEvenList(node)) // []

        arr = [1]
        node = ListNode.list(from: arr)
        print(oddEvenList(node)) // [1]

        arr = [1,2]
        node = ListNode.list(from: arr)
        print(oddEvenList(node)) // [1,2]

        arr = [1,2,3]
        node = ListNode.list(from: arr)
        print(oddEvenList(node)) // [1,3,2]

        arr = [1,2,3,4]
        node = ListNode.list(from: arr)
        print(oddEvenList(node)) // [1,3,2,4]

        arr = [1,2,3,4,5]
        node = ListNode.list(from: arr)
        print(oddEvenList(node)) // [1,3,5,2,4]

        arr = [1,2,3,4,5,6]
        node = ListNode.list(from: arr)
        print(oddEvenList(node)) // [1,3,5,2,4,6]

        arr = [1,2,3,4,5,6,7]
        node = ListNode.list(from: arr)
        print(oddEvenList(node)) // [1,3,5,7,2,4,6]
    }
}
