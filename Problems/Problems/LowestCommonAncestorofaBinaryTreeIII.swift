class LowestCommonAncestorofaBinaryTreeIII {
    public class Node {
        public var val: Int
        public var left: Node? {
            didSet {
                left?.parent = self
            }
        }
        public var right: Node? {
            didSet {
                right?.parent = self
            }
        }
        public var parent: Node?
        public init(_ val: Int) {
            self.val = val
            self.left = nil
            self.right = nil
            self.parent = nil
        }
    }

    func lowestCommonAncestor(_ p: Node?,_ q: Node?) -> Node? {
        var n1 = p
        var n2 = q
        while n1 !== n2 {
            n1 = n1?.parent ?? q
            n2 = n2?.parent ?? p
        }
        return n1
    }
    
    func lowestCommonAncestor2(_ p: Node?,_ q: Node?) -> Node? {
        var n = p
        var set: Set<Int> = []
        while n != nil {
            set.insert(n!.val)
            n = n?.parent
        }
        n = q
        while n != nil {
            if set.contains(n!.val) {
                return n
            }
            n = n?.parent
        }
        return nil
    }

    func tests() {
        var (root, p, q) = ex1
        print(lowestCommonAncestor(p, q)?.val) // 3
        
        (root, p, q) = ex2
        print(lowestCommonAncestor(p, q)?.val) // 5
        print(lowestCommonAncestor(q, p)?.val) // 5
    }
    
    var ex1: (root: Node?, p: Node?, q: Node?) {
        var root = Node(3)
        var p = Node(5)
        var q = Node(1)
        root.left = p
        root.right = q
        return (root, p, q)
    }
    
    var ex2: (root: Node?, p: Node?, q: Node?) {
        var root = Node(3)
        var p = Node(5)
        var q = Node(4)
        root.left = p
        p.left = Node(6)
        p.right = Node(2)
        p.right?.right = q
        return (root, p, q)
    }
}

