class MaximumTwinSumOfALinkedList {
    func pairSum(_ head: ListNode?) -> Int {
        var node = head
        var fast = head
        while fast?.next?.next != nil {
            fast = fast?.next?.next
            node = node?.next
        }
        node = reversedList(from: node?.next)
        fast = head
        var result = 0
        while node != nil {
            result = max(result, node!.val + fast!.val)
            node = node?.next
            fast = fast?.next
        }
        
        return result
    }
    
    func reversedList(from head: ListNode?) -> ListNode? {
        var curr = head
        var prev: ListNode?
        while curr != nil {
            let next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }
        return prev
    }

    func pairSum2(_ head: ListNode?) -> Int {
        var node = head
        var fast = head
        var array: [Int] = [node!.val]
        while fast?.next?.next != nil {
            fast = fast?.next?.next
            node = node?.next
            array.append(node!.val)
        }
        var result = 0
        var i = array.count - 1
        while node?.next != nil {
            result = max(result, array[i] + node!.next!.val)
            node = node?.next
            i -= 1
        }
        
        return result
    }
    
    func tests() {
        print(pairSum([5,4,2,1])) // 6
        print(pairSum([4,2,2,3])) // 7
        print(pairSum([1,100000])) // 100001
    }
}

