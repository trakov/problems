class RemoveDuplicatesFromSortedList {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var n = head
        while n != nil {
            let next = n?.next
            if n?.val == next?.val {
                n?.next = next?.next
            } else {
                n = next
            }
        }
        return head
    }
    
    func tests() {
        print(deleteDuplicates(ListNode.list(from: [1,1,1]))) // 1
        print(deleteDuplicates(ListNode.list(from: [1,1,2]))) // 1, 2
        print(deleteDuplicates(ListNode.list(from: [1,1,2,3,3]))) // 1, 2, 3
    }
}
