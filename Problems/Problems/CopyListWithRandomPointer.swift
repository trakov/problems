public class Node3 {
    public var val: Int
    public var next: Node3?
    public var random: Node3?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}

class CopyListWithRandomPointer {
    func copyRandomList(_ head: Node3?) -> Node3? {
        guard head != nil else { return nil }
        var node = head
        while let val = node?.val {
            let newNode = Node3(val)
            newNode.next = node?.next
            node?.next = newNode
            node = newNode.next
        }
        
        node = head
        while node != nil {
            node?.next?.random = node?.random?.next
            node = node?.next?.next
        }
        
        var oldList = head
        var newList = head?.next
        let headOld = head?.next
        
        while oldList != nil {
            oldList?.next = oldList?.next?.next
            newList?.next = newList?.next?.next
            oldList = oldList?.next
            newList = newList?.next
        }
        return headOld
    }
    
    func tests() {
        var head = Node3(7)
        var node13 = Node3(13)
        var node11 = Node3(11)
        var node10 = Node3(10)
        var node1 = Node3(1)
        head.next = node13
        head.random = nil
        node13.next = node11
        node13.random = head
        node11.next = node10
        node11.random = node1
        node10.next = node1
        node10.random = node11
        node1.next = nil
        node1.random = head
        print(copyRandomList(head)) //
    }
}

