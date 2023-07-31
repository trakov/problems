class LinkedListCycle {
    func hasCycle(_ head: ListNode?) -> Bool {
        guard head != nil else { return false }
        var fast = head
        var slow = head
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
            if fast === slow {
                return true
            }
        }
        
        return false
    }

    func tests() {
        var head: ListNode?
        
        head = ListNode.list(from: [1,1,1])
        head?.connectLastNode(to: -1)
        print(hasCycle(head)) // false

        head = ListNode.list(from: [3,2,0,-4])
        head?.connectLastNode(to: 1)
        print(hasCycle(head)) // true

        head = ListNode.list(from: [1,2])
        head?.connectLastNode(to: 0)
        print(hasCycle(head)) // true

        head = ListNode.list(from: [1,2])
        head?.connectLastNode(to: -1)
        print(hasCycle(head)) // false

        head = ListNode.list(from: [1])
        head?.connectLastNode(to: -1)
        print(hasCycle(head)) // false
    }
}

extension ListNode {
    func connectLastNode(to pos: Int) {
        guard pos >= 0 else { return }
        var node: ListNode? = self
        var i = 0
        var nextNodeToConnectLatest: ListNode?
        while node?.next != nil {
            if i == pos {
                nextNodeToConnectLatest = node
            }
            i += 1
            node = node?.next
        }
        node?.next = nextNodeToConnectLatest
    }
}
