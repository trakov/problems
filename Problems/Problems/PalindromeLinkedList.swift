class PalindromeLinkedList {
    func isPalindrome(_ head: ListNode?) -> Bool {
        var low = head // the head of second part of given linked list
        var fast = head
        while fast != nil {
            low = low?.next
            fast = fast?.next?.next
        }
        var node = low
        var revHead: ListNode?
        while node != nil {
            let temp = node?.next
            node?.next = revHead
            revHead = node
            node = temp
        }
        node = head
        var rev = revHead
        while rev != nil {
            guard node?.val == rev?.val else {
                return false
            }
            node = node?.next
            rev = rev?.next
        }
        return true
    }
    
    func isPalindrome2(_ head: ListNode?) -> Bool {
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
        
        array = [1,2]
        print(isPalindrome(ListNode.list(from: array))) // false

        array = [2,2]
        print(isPalindrome(ListNode.list(from: array))) // true

        array = [1,2,1]
        print(isPalindrome(ListNode.list(from: array))) // true

        array = [1,1,2,1]
        print(isPalindrome(ListNode.list(from: array))) // false

        array = [1,2,2,1]
        print(isPalindrome(ListNode.list(from: array))) // true
    }
}
