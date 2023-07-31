class ReorderList {
    func reorderList(_ head: ListNode?) {
        guard head?.next?.next != nil else { return }
        var slow = head
        var fast = head
        while fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        var back = slow?.next
        slow?.next = nil
        
        var cur = back
        var prev: ListNode?
        while cur != nil {
            var temp = cur?.next
            cur?.next = prev
            prev = cur
            cur = temp
        }
        
        var odd = head
        var even = prev
        while odd != nil || even != nil {
            let nextOdd = odd?.next
            odd?.next = even
            let nextEven = even?.next
            even?.next = nextOdd
            odd = nextOdd
            even = nextEven
        }
    }
    
    func tests() {
        var node: ListNode = [1,2,3,4]
        reorderList(node)
        print(node) // [1,4,2,3]
        
        node = [1,2,3,4,5]
        reorderList(node)
        print(node) // [1,5,2,4,3]
    }
}

