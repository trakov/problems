class MergeNodesinBetweenZeros {
    func mergeNodes(_ head: ListNode?) -> ListNode? {
        var node = head?.next
        var cur = node?.next
        while let val = cur?.val {
            node!.val += val
            cur = cur?.next
            if val == 0 {
                node?.next = cur
                node = node?.next
                cur = cur?.next
            }
        }
        return head?.next
    }
    
    func tests() {
        print(mergeNodes([0,3,1,0,4,5,2,0])) // [4,11]
        print(mergeNodes([0,1,0,3,0,2,2,0])) // [1,3,4]
    }
}

