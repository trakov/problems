class RemoveLinkedListElements {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        guard head != nil else { return nil }
        
        var result = head
        while result?.val == val {
            result = result?.next
        }
        
        var node = result
        var prevNode = result
        while node != nil {
            if node?.val == val {
                prevNode?.next = node?.next
            } else {
                prevNode = node
            }
            node = node?.next
        }
        
        return result
    }
    
    func tests() {
        var array: [Int] = []
        
        array = [1,2,6,3,4,5,6]
        print(removeElements(ListNode.list(from: array), 6)) // [1,2,3,4,5]

        array = []
        print(removeElements(ListNode.list(from: array), 1)) // []

        array = [7,7,7,7]
        print(removeElements(ListNode.list(from: array), 7)) // []
    }
}
