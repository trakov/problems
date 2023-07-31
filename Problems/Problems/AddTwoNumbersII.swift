class AddTwoNumbersII {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        func stack(_ list: ListNode?) -> [Int] {
            var s: [Int] = []
            var node = list
            while node != nil {
                s.append(node!.val)
                node = node?.next
            }
            return s
        }
        var s1 = stack(l1)
        var s2 = stack(l2)
        var result: ListNode?
        var one = 0
        while !s1.isEmpty || !s2.isEmpty {
            var val = (s1.popLast() ?? 0) + (s2.popLast() ?? 0) + one
            one = val / 10
            val %= 10
            result = ListNode(val, result)
        }
        if one == 1 {
            return ListNode(1, result)
        } else {
            return result
        }
    }
    
    func tests() {
        print(addTwoNumbers([7,2,4,3], [5,6,4])) // [7,8,0,7]
        print(addTwoNumbers([2,4,3], [5,6,4])) // [8,0,7]
        print(addTwoNumbers([0], [0])) // [0]
    }
}

