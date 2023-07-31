public class Node2 {
    public var val: Int
    public var children: [Node2]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
    public init(_ val: Int, _ children: [Node2]) {
        self.val = val
        self.children = children
    }
}

class NAryTreePreorderTraversal {
    func preorder(_ root: Node2?) -> [Int] {
        guard let node = root else { return [] }
        var result = [node.val]
        for child in node.children {
            result += preorder(child)
        }
        return result
    }

    func iterative(_ root: Node2?) -> [Int] {
        guard root != nil else { return [] }
        var node = root
        var stack: [Node2] = [node!]
        var result: [Int] = []
        while !stack.isEmpty {
            node = stack.removeLast()
            result.append(node!.val)
            for child in node!.children.reversed() {
                stack.append(child)
            }
        }
        return result
    }
    
    func tests() {
        var node = Node2(1, [
            Node2(3, [Node2(5), Node2(6)]),
            Node2(2),
            Node2(4)
        ])
        
        print(preorder(node)) // [1,3,5,6,2,4]
        
        node = Node2(1, [
            Node2(2),
            Node2(3, [Node2(6), Node2(7, [Node2(11, [Node2(14)])])]),
            Node2(4, [Node2(8, [Node2(12)])]),
            Node2(5, [Node2(9, [Node2(13)]), Node2(10)])
        ])
        
        print(preorder(node)) // [1,2,3,6,7,11,14,4,8,12,5,9,13,10]
    }
}
