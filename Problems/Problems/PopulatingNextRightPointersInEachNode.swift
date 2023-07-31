public class TLNode {
    public var val: Int
    public var left: TLNode?
    public var right: TLNode?
    public var next: TLNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
    public init(_ val: Int, _ left: TLNode? = nil, _ right: TLNode? = nil) {
        self.val = val
        self.left = left
        self.right = right
        self.next = nil
    }
}

extension TLNode: CustomStringConvertible {
    public var description: String {
        var res = "\(val) "
        if let left = left {
            res += left.description
        }
        if let right = right {
            res += right.description
        }
        return res
    }
}

class PopulatingNextRightPointersInEachNode {
    func connect(_ root: TLNode?) -> TLNode? {
        recursive(root)
        return root
    }

    func recursive(_ root: TLNode?) {
        guard let root = root else { return }
        root.left?.next = root.right
        root.right?.next = root.next?.left
        recursive(root.left)
        recursive(root.right)
    }

    func tests() {
        var node = TLNode(
            1,
            TLNode(2, TLNode(4), TLNode(5)),
            TLNode(3, TLNode(6), TLNode(7))
        )
//        print(connect(node))
        
//        [-1,0,1,2,3,4,5,6,7,8,9,10,11,12,13]
        
        node = TLNode(
            -1,
            TLNode(
                0,
                TLNode(2, TLNode(6), TLNode(7)),
                TLNode(3, TLNode(8), TLNode(9))
            ),
             TLNode(
                 1,
                 TLNode(4, TLNode(10), TLNode(11)),
                 TLNode(5, TLNode(12), TLNode(13))
             )
        )
        print(connect(node))
        
        
    }
}
