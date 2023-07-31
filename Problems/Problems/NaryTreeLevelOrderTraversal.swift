class NaryTreeLevelOrderTraversal {
    func levelOrder(_ root: Node2?) -> [[Int]] {
        guard root != nil else { return [] }
        var result: [[Int]] = []
        var level = [root!]
        
        while !level.isEmpty {
            result.append(level.map { $0.val })
            var nextLevel: [Node2] = []
            for n in level {
                nextLevel.append(contentsOf: n.children)
            }
            level = nextLevel
        }
        
        return result
    }
    
    func tests() {
        var node = Node2(1, [
            Node2(3, [Node2(5), Node2(6)]),
            Node2(2),
            Node2(4)
        ])
        
        print(levelOrder(node)) // [[1],[3,2,4],[5,6]]
        
        node = Node2(1, [
            Node2(2),
            Node2(3, [Node2(6), Node2(7, [Node2(11, [Node2(14)])])]),
            Node2(4, [Node2(8, [Node2(12)])]),
            Node2(5, [Node2(9, [Node2(13)]), Node2(10)])
        ])
        
        print(levelOrder(node)) // [[1],[2,3,4,5],[6,7,8,9,10],[11,12,13],[14]]
    }
}

