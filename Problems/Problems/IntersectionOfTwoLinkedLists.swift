class IntersectionOfTwoLinkedLists {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        guard headA != nil && headB != nil else { return nil }

        var setA: Set<ListNode> = []
        var a = headA
        while a != nil {
            setA.insert(a!)
            a = a?.next
        }
        
        a = headB
        while a != nil {
            if setA.contains(a!) {
                return a
            }
            a = a?.next
        }
        
        return nil
    }
    
    func twoPointers(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        guard headA != nil && headB != nil else { return nil }
        var a = headA
        var b = headB
        while a !== b {
            a = (a == nil) ? headB : a?.next
            b = (b == nil) ? headA : b?.next
        }
        return a
    }
    
    func tests() {
        let eight = ListNode(8, ListNode(4, ListNode(5, nil)))
        let a = ListNode(4, ListNode(1, eight))
        let b = ListNode(5, ListNode(6, ListNode(1, eight)))
        print(getIntersectionNode(a, b))
    }
}

extension ListNode: Hashable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        lhs === rhs
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
