class NaryTreePostorderTraversal {
    public class Node {
        public var val: Int
        public var children: [Node]
        public init(_ val: Int, _ children: [Node] = []) {
            self.val = val
            self.children = children
        }
    }

    // iterative
    func postorder(_ root: Node?) -> [Int] {
        var result: [Int] = []
        guard let root else { return result }
        var stack = [(node: root, vis: false)]
        while var cur = stack.popLast() {
            if cur.vis {
                result.append(cur.node.val)
            } else {
                cur.vis = true
                stack.append(cur)
                stack.append(contentsOf: cur.node.children.reversed().map {
                    ($0, false)
                })
            }
        }
        return result
    }
    
    // iterative + reverse
    func postorder1(_ root: Node?) -> [Int] {
        var result: [Int] = []
        guard let root else { return result }
        var stack: [Node] = [root]
        while !stack.isEmpty {
            let node = stack.removeLast()
            result.append(node.val)
            stack.append(contentsOf: node.children)
        }
        return result.reversed()
    }

    // recursive
    func postorder2(_ root: Node?) -> [Int] {
        guard let root else { return [] }
        return root.children.reduce([], {
            $0 + postorder($1)
        }) + [root.val]
    }
    
    func tests() {
        var root = Node(1, [Node(3, [Node(5),Node(6)]), Node(2), Node(4)])
        print(postorder(root)) // [5,6,3,2,4,1]
        
        root = Node(1, [
            Node(2),
            Node(3, [Node(6),Node(7, [Node(11, [Node(14)])])]),
            Node(4, [Node(8, [Node(12)])]),
            Node(5, [Node(9, [Node(13)]), Node(10)])
        ])
        print(postorder(root)) // [2,6,14,11,7,3,12,8,4,13,9,10,5,1]
    }
}

