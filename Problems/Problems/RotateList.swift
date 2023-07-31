class RotateList {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard head?.next != nil && k != 0 else { return head }
        var node = head
        var n = 1
        while node?.next?.next != nil {
            node = node?.next?.next
            n += 2
        }
        n += (node?.next != nil) ? 1 : 0
        var tail = node?.next ?? node
        var steps = n - k % n
        guard steps != n else { return head }
        var newHead = head
        if steps == n - 1 {
            newHead = tail
        } else {
            var i = 0
            while i < steps {
                newHead = newHead?.next
                i += 1
            }
        }
        tail?.next = head
        while steps > 0 {
            tail = tail?.next
            steps -= 1
        }
        tail?.next = nil
        return newHead
    }
    
    func tests() {
        print(rotateRight([1,2,3], 2000000000)) // [2,3,1]
        print(rotateRight([1,2,3,4,5], 2)) // [4,5,1,2,3]
        print(rotateRight([0,1,2], 4)) // [2,0,1]
    }
}

