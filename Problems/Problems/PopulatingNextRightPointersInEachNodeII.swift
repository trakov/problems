class PopulatingNextRightPointersInEachNodeII {
    func connect(_ root: TLNode?) -> TLNode? {
        guard root != nil else { return root }
        var queue: [TLNode] = [root!]
        
        while !queue.isEmpty {
            var childs: [TLNode] = []
            for node in queue {
                if node.left != nil {
                    childs.last?.next = node.left
                    childs.append(node.left!)
                }
                if node.right != nil {
                    childs.last?.next = node.right
                    childs.append(node.right!)
                }
            }
            queue = childs
        }
        
        return root
    }

    func recursive(_ root: TLNode?) {
        guard let root = root else { return }
        root.left?.next = root.right
        root.right?.next = root.next?.left ?? root.next?.right
        recursive(root.left)
        recursive(root.right)
    }

    func tests() {
        var node = TLNode(
            1,
            TLNode(2, TLNode(4), TLNode(5)),
            TLNode(3, nil, TLNode(7))
        )
        print(connect(node))
        
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
//        print(connect(node))
    }
}
