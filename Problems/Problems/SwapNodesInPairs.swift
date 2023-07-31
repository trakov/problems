class SwapNodesInPairs {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        guard let result = head?.next else { return head }
        var node1 = head
        var node2: ListNode? = result
        while node1 != nil && node2 != nil {
            let temp = node2?.next
            node2?.next = node1
            node1?.next = temp?.next ?? temp
            node2 = temp?.next
            node1 = temp
        }
        return result
    }
    
    func tests() {
        print(swapPairs(ListNode.list(from: [1,2,3]))) // [2,1,3]
        print(swapPairs(ListNode.list(from: [1,2,3,4]))) // [2,1,4,3]
        print(swapPairs(ListNode.list(from: []))) // []
        print(swapPairs(ListNode.list(from: [1]))) // [1]
    }
}

