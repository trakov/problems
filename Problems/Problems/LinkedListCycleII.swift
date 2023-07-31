class LinkedListCycleII {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return nil }
        var fast = head
        var slow = head
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
            if fast === slow {
                fast = head
                while fast !== slow {
                    slow = slow?.next
                    fast = fast?.next
                }
                return slow
            }
        }
        
        return nil
    }

    func tests() {
        var head: ListNode?
        
        head = ListNode.list(from: [1,1,1])
        head?.connectLastNode(to: -1)
        print(detectCycle(head)?.val) // -1

        head = ListNode.list(from: [3,2,0,-4])
        head?.connectLastNode(to: 1)
        print(detectCycle(head)?.val) // 1

        head = ListNode.list(from: [1,2])
        head?.connectLastNode(to: 0)
        print(detectCycle(head)?.val) // 0

        head = ListNode.list(from: [1,2])
        head?.connectLastNode(to: -1)
        print(detectCycle(head)?.val) // -1

        head = ListNode.list(from: [1])
        head?.connectLastNode(to: -1)
        print(detectCycle(head)?.val) // -1
    }
}
