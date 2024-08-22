class InsertintoaSortedCircularLinkedList {
    public class Node {
        public var val: Int
        public var next: Node?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
        static func from(_ array: [Int]) -> Node? {
            guard !array.isEmpty else { return nil }
            let head = Node(array.first!)
            var cur = head
            for num in array.dropFirst() {
                cur.next = Node(num)
                cur = cur.next!
            }
            cur.next = head
            return head
        }
    }

    func insert(_ head: Node?, _ insertVal: Int) -> Node? {
        guard let head else {
            let node = Node(insertVal)
            node.next = node
            return node
        }
        var prev = head
        var node = head.next!
        let insert = Node(insertVal)
        var inserted = false
        while node !== head && !inserted {
            if prev.val == insertVal {
                prev.next = insert
                insert.next = node
                inserted = true
            } else if prev.val > insertVal {
                if node.val > insertVal && node.val < prev.val {
                    prev.next = insert
                    insert.next = node
                    inserted = true
                } else {
                    prev = prev.next!
                    node = node.next!
                }
            } else if node.val >= insertVal || node.val < prev.val {
                prev.next = insert
                insert.next = node
                inserted = true
            } else {
                prev = prev.next!
                node = node.next!
            }
        }
        if !inserted {
            prev.next = insert
            insert.next = node
        }
        return head
    }
    
    func tests() {
        var head = insert(Node.from([3,4,1]), 2)
        print(head) // [3,4,1,2]
        
        head = insert(Node.from([]), 2)
        print(head) // [2]
        
        head = insert(Node.from([1]), 0)
        print(head) // [1,0]
    }
}

