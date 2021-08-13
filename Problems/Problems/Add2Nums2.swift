public class ListNode2: CustomStringConvertible {
    public var val: Int
    public var next: ListNode2?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode2?) { self.val = val; self.next = next; }
    
    public var description: String {
        return "\(val) -> \(next?.description ?? "nil")"
    }
}
class Add2Nums2 {
    func addTwoNumbers(_ l1: ListNode2?, _ l2: ListNode2?) -> ListNode2? {
        let r1 = reverse(list: l1)
        let r2 = reverse(list: l2)
        return reverse(list: addTwoNumbersReverse(r1, r2))
    }
    func addTwoNumbersReverse(_ l1: ListNode2?, _ l2: ListNode2?) -> ListNode2? {
        let dummy = ListNode2(-1)
        var tail = dummy
        var n1 = l1
        var n2 = l2
        var remDiv = 0
        while n1 != nil || n2 != nil {
            let sum = (n1?.val ?? 0) + (n2?.val ?? 0) + remDiv
            let mod = sum % 10
            remDiv = sum / 10
            tail.next = ListNode2(mod)
            tail = tail.next!
            n1 = n1?.next
            n2 = n2?.next
        }
        if remDiv > 0 {
            tail.next = ListNode2(remDiv)
        }
        return dummy.next
    }
    func reverse(list: ListNode2?) -> ListNode2? {
        guard var a: ListNode2? = list else { return nil }
        guard var b: ListNode2? = list?.next else { return list }
        a?.next = nil
        
        while b != nil {
            let t = b?.next
            b?.next = a
            a = b
            b = t
        }
        return a
    }
    
    func list(from array: [Int]) -> ListNode2? {
        var l: ListNode2?
        var last: ListNode2?
        for n in array.enumerated() {
            let el = ListNode2(n.element)
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
        let l1 = list(from: [1,2])
        let l2 = list(from: [5,6,4])
        let s = addTwoNumbers(l1, l2)
        print(s)
    }

    func reverseList(_ head: ListNode2?) -> ListNode2? {
        guard var a: ListNode2? = head else { return nil }
        guard var b: ListNode2? = head?.next else { return head }
        a?.next = nil
        
        while b != nil {
            let t = b?.next
            b?.next = a
            a = b
            b = t
        }
        return a
    }
}
