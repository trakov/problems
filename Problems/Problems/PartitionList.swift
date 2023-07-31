class PartitionList {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        guard head?.next != nil else { return head }
        var lessHead: ListNode?
        var lessTail: ListNode?
        var moreHead: ListNode?
        var moreTail: ListNode?
        
        var node = head
        
        while node != nil {
            if node!.val < x {
                if lessHead == nil { lessHead = node }
                if lessTail == nil {
                    lessTail = node
                } else {
                    lessTail?.next = node
                    lessTail = lessTail?.next
                }
            } else {
                if moreHead == nil { moreHead = node }
                if moreTail == nil {
                    moreTail = node
                } else {
                    moreTail?.next = node
                    moreTail = moreTail?.next
                }
            }
            node = node?.next
        }
        lessTail?.next = moreHead
        moreTail?.next = nil
        return lessHead ?? moreHead
    }
    
    func tests() {
        print(partition([1,1], 0)) // [1,1]
        print(partition([1,4,3,2,5,2], 3)) // [1,2,2,4,3,5]
        print(partition([2,1], 2)) // [1,2]
    }
}

