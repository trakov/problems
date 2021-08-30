public class ListNode: CustomStringConvertible {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    public var description: String {
        return "\(val) -> \(next?.description ?? "nil")"
    }

    public static func list(from array: [Int]) -> ListNode? {
        var l: ListNode?
        var last: ListNode?
        for n in array.enumerated() {
            let el = ListNode(n.element)
            if n.offset == 0 {
                l = el
            } else {
                last?.next = el
            }
            last = el
        }
        return l
    }
}
class Add2Nums {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode(-1)
        var tail = dummy
        var n1 = l1
        var n2 = l2
        var remDiv = 0
        while n1 != nil || n2 != nil {
            let sum = (n1?.val ?? 0) + (n2?.val ?? 0) + remDiv
            let mod = sum % 10
            remDiv = sum / 10
            
//            print(sum, remDiv, mod)

            tail.next = ListNode(mod)
            tail = tail.next!
            n1 = n1?.next
            n2 = n2?.next
        }
        if remDiv > 0 {
            tail.next = ListNode(remDiv)
        }
//        print(dummy.next)
        return dummy.next
    }
    
    func list(from array: [Int]) -> ListNode? {
        var l: ListNode?
        var last: ListNode?
        for n in array.enumerated() {
            let el = ListNode(n.element)
            if n.offset == 0 {
                l = el
            } else {
                last?.next = el
            }
            last = el
        }
        return l
    }

    func tests() {
        let l1 = list(from: [7,2,4,3])
        let l2 = list(from: [5,6,4])
        let s = addTwoNumbers(l1, l2)
        print(s)
    }
}
