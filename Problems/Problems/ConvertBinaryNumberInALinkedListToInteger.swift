class ConvertBinaryNumberInALinkedListToInteger {
    func getDecimalValue(_ head: ListNode?) -> Int {
        guard head != nil else { return 0 }
        var res = ""
        var node = head
        while node != nil {
            res += String(node!.val)
            node = node!.next
        }
        return Int(res, radix: 2)!
    }

    func tests() {
        print(getDecimalValue(ListNode.list(from: [1,0,1]))) // 5
        print(getDecimalValue(ListNode.list(from: [0]))) // 0
        print(getDecimalValue(ListNode.list(from: [0,1]))) // 1
        print(getDecimalValue(ListNode.list(from: [1,0]))) // 2
    }
}
