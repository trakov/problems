class RemoveDuplicatesFromSortedListII2 {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return nil }
        var result: ListNode?
        var newNode = result
        var node = head
        
        while node != nil {
            var distinct = node
            while node?.val == node?.next?.val {
                node = node?.next
                distinct = nil
            }
            if distinct != nil {
                if result == nil {
                    result = distinct
                    newNode = result
                } else {
                    newNode?.next = distinct
                    newNode = newNode?.next
                }
            }
            node = node?.next
        }
        newNode?.next = nil
        return result
    }
    
    func tests() {
        print(deleteDuplicates(ListNode.list(from: [1,2,3,3,4,4,5]))) // [1,2,5]
        print(deleteDuplicates(ListNode.list(from: [1,1,1,2,3]))) // [2,3]
        print(deleteDuplicates(ListNode.list(from: [1,1,1,2,3,3,3]))) // [2]
    }
}

