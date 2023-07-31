class ConvertSortedListToBinarySearchTree {
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        guard head != nil else { return nil }
        return treeNode(from: head, tail: nil)
    }
    
    func treeNode(from head: ListNode?, tail: ListNode?) -> TreeNode? {
        guard head !== tail else { return nil }
        var slow = head
        var fast = head
        while fast?.next !== tail && fast?.next?.next !== tail {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return TreeNode(
            slow!.val,
            treeNode(from: head, tail: slow),
            treeNode(from: slow?.next, tail: tail)
        )
    }

    func tests() {
        print(sortedListToBST(ListNode.list(from: [-10,-3,0,5,9])))
        print(sortedListToBST(ListNode.list(from: [])))
    }
}
