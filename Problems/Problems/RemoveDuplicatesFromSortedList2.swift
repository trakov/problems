class RemoveDuplicatesFromSortedList2 {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return nil }
        guard head?.next != nil else { return head }
        let temp = ListNode(0, head)
        var distinct = temp
        var candidate = head
        var node = head
        while node != nil {
            while candidate!.val == node?.val {
                node = node!.next
            }
            if candidate!.next === node {
                distinct = candidate!
            } else {
                distinct.next = node
            }
            candidate = node
        }
        return temp.next
    }

    func tests() {
        print(deleteDuplicates(ListNode.list(from: [1,2,3,3,4,4,5]))) // [1,2,5]
        print(deleteDuplicates(ListNode.list(from: [1,1,1,2,3]))) // [2,3]
    }
}
