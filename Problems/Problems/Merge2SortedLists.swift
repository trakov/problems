class Merge2SortedLists {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        guard list1 != nil else { return list2 }
        guard list2 != nil else { return list1 }
        var n1 = list1
        var n2 = list2
        let dummy = ListNode(0)
        var node: ListNode? = dummy
        while n1 != nil && n2 != nil {
            if n1!.val <= n2!.val {
                node?.next = n1
                n1 = n1?.next
            } else {
                node?.next = n2
                n2 = n2?.next
            }
            node = node?.next
        }
        node?.next = n1 ?? n2
        return dummy.next
    }

    func mergeTwoLists3(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var n1 = l1
        var n2 = l2
        var node: ListNode? = ListNode(0)
        var result = ListNode(0, node)
        while n1 != nil || n2 != nil {
            guard n1 != nil else {
                node?.next = n2
                break
            }
            guard n2 != nil else {
                node?.next = n1
                break
            }
            if n1!.val < n2!.val {
                node?.next = n1
                n1 = n1?.next
            } else {
                node?.next = n2
                n2 = n2?.next
            }
            node = node?.next
            guard n1 != nil else {
                node?.next = n2
                break
            }
            guard n2 != nil else {
                node?.next = n1
                break
            }
        }
        return result.next?.next
    }
    
    func mergeTwoLists2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var tail1 = l1
        var tail2 = l2
        var result: ListNode?
        var tail: ListNode?
        
        func appendToResult(l: inout ListNode?) {
            if result == nil {
                result = l
            } else if tail == nil {
                tail = l
                result?.next = tail
            } else {
                tail?.next = l
                tail = tail?.next
            }
            l = l?.next
        }
        
        while tail1 != nil || tail2 != nil {
            if tail1 == nil || tail2 == nil {
                var l = tail1 ?? tail2
                appendToResult(l: &l)
                break
            }
            if tail1!.val <= tail2!.val {
                appendToResult(l: &tail1)
            } else {
                appendToResult(l: &tail2)
            }
        }
        return result
    }
    
    func tests() {
        print(mergeTwoLists(
                ListNode.list(from: [1,2,4]),
                ListNode.list(from: [1,3,4, 5, 6, 7])))
        print(mergeTwoLists(
                ListNode.list(from: []),
                ListNode.list(from: [])))
        print(mergeTwoLists(
                ListNode.list(from: []),
                ListNode.list(from: [0])))
    }
}
