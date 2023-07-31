class ReverseNodesInKGroup {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        var n = 0
        var newHead = head
        while n < k && newHead != nil {
            newHead = newHead?.next
            n += 1
        }
        guard n == k else { return head }
        let reversedHead = reverseList(head, k)
        head?.next = reverseKGroup(newHead, k)
        return reversedHead
    }

    func reverseList(_ head: ListNode?, _ k: Int) -> ListNode? {
        var i = 0
        var curr = head
        var prev: ListNode? = nil
        while curr != nil && i < k {
            var nextNode = curr?.next
            curr?.next = prev
            prev = curr
            curr = nextNode
            i += 1
        }
        return prev
    }

    func reverseKGroup2(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard head?.next != nil else { return head }
        var node = head
        var n = 0
        while node != nil {
            n += 1
            node = node?.next
        }
        var i = 0
        var prev = head
        node = head
        var res: [(ListNode, ListNode)] = []
        while i < n / k {
            var j = 0
            let newTail = node
            var temp: ListNode?
            while j < k {
                temp = node?.next
                node?.next = prev
                prev = node
                node = temp
                j += 1
            }
            i += 1
            res.append((prev!, newTail!))
            prev = nil
        }
        i = 0
        while i < res.count - 1 {
            res[i].1.next = res[i+1].0
            i += 1
        }
        res.last?.1.next = node
        return res[0].0
    }
    
    func tests() {
        print(reverseKGroup([1,2,3,4,5], 2)) // [2,1,4,3,5]
        print(reverseKGroup([1,2,3,4,5], 3)) // [3,2,1,4,5]
    }
}

