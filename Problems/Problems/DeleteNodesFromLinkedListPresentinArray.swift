class DeleteNodesFromLinkedListPresentinArray {
    func modifiedList(_ nums: [Int], _ head: ListNode?) -> ListNode? {
        guard head != nil else { return nil }
        let nums = Set(nums)
        let dummy = ListNode(0, head)
        var node: ListNode? = dummy
        
        while let val = node?.next?.val {
            if nums.contains(val) {
                node?.next = node?.next?.next
            } else {
                node = node?.next
            }
        }

        return dummy.next
    }
    
    func tests() {
        print(modifiedList([1,2,3], [1,2,3,4,5])) // [4,5]
        print(modifiedList([1], [1,2,1,2,1,2])) // [2,2,2]
        print(modifiedList([5], [1,2,3,4])) // [1,2,3,4]
    }
}

