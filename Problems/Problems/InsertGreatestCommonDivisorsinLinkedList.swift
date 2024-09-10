class InsertGreatestCommonDivisorsinLinkedList {
    func gcd(_ a: Int, _ b: Int) -> Int {
        if a == 0 {
            return b
        } else {
            return gcd(b % a, a)
        }
    }

    func insertGreatestCommonDivisors(_ head: ListNode?) -> ListNode? {
        guard head?.next != nil else { return head }
        var node = head
        while node?.next != nil {
            let gcdNode = ListNode(gcd(node!.val, node!.next!.val))
            let next = node?.next
            node?.next = gcdNode
            gcdNode.next = next
            node = next
        }
        return head
    }
    
    func tests() {
        print(insertGreatestCommonDivisors([18,6,10,3])) // [18,6,6,2,10,1,3]
        print(insertGreatestCommonDivisors([7])) // [7]
    }
}

