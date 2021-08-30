class Merge2SortedLists {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
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
