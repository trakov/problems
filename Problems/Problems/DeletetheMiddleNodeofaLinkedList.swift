final class DeletetheMiddleNodeofaLinkedList {
    func deleteMiddle(_ head: ListNode?) -> ListNode? {
        guard head?.next != nil else { return nil }
        var n = 0
        var node = head
        while node != nil {
            node = node?.next
            n += 1
        }
        node = head
        n /= 2
        while n > 1 {
            node = node?.next
            n -= 1
        }
        node?.next = node?.next?.next
        return head
    }
    
    func tests() {
        var node: ListNode = [1,3,4,7,1,2,6]
        print(deleteMiddle(node)) // [1,3,4,1,2,6]
        node = [1,2,3,4]
        print(deleteMiddle(node)) // [1,2,4]
        node = [2,1]
        print(deleteMiddle(node)) // [2]
    }
}
