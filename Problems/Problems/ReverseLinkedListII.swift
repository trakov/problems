class ReverseLinkedListII {
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        guard head != nil && left != right else { return head }
        let dummy = ListNode(0)
        dummy.next = head
        
        var pre: ListNode? = dummy
        for _ in 1..<left {
            pre = pre?.next
        }
        
        let start = pre?.next
        var end = start?.next
        for _ in 0..<(right - left) {
            start?.next = end?.next
            end?.next = pre?.next
            pre?.next = end
            end = start?.next
        }
        
        return dummy.next
    }
    
    func tests() {
        print(reverseBetween([1,2,3,4,5], 2, 4)) // [1,4,3,2,5]
        print(reverseBetween([5], 1, 1)) // [5]
    }
}

