class PalindromeLinkedList {
    func isPalindrome(_ head: ListNode?) -> Bool {
        guard head != nil else { return true }
        guard var node: ListNode? = head?.next else { return true }
        var reversed: ListNode? = ListNode(head!.val, nil)
        while node != nil {
            let temp = reversed
            
            reversed = ListNode(node!.val, temp)
            
            node = node?.next
        }
        
        node = head
        while node?.val == reversed?.val && (node != nil || reversed != nil) {
            node = node?.next
            reversed = reversed?.next
        }
        return node == nil && reversed == nil
    }

    func arraySolution(_ head: ListNode?) -> Bool {
        guard head != nil else { return true }
        
        var node = head
        var array: [Int] = []
        while node != nil {
            array.append(node!.val)
            node = node?.next
        }
        
        return array == array.reversed()
    }
    
    func tests() {
        var array: [Int] = []

        array = []
        print(isPalindrome(ListNode.list(from: array))) // true

        array = [1]
        print(isPalindrome(ListNode.list(from: array))) // true
        
        array = [1,2,2,1]
        print(isPalindrome(ListNode.list(from: array))) // true

        array = [1,2,1]
        print(isPalindrome(ListNode.list(from: array))) // true

        array = [1,2]
        print(isPalindrome(ListNode.list(from: array))) // false
    }
}
