class CreateBinaryTreeFromDescriptions {
    func createBinaryTree(_ descriptions: [[Int]]) -> TreeNode? {
        var parents: Set<Int> = []
        var children: Set<Int> = []
        var map: [Int: (Int, Int)] = [:]
        for node in descriptions {
            parents.insert(node[0])
            children.insert(node[1])
            var childs = map[node[0]] ?? (0, 0)
            if node[2] == 1 {
                childs.0 = node[1]
            } else {
                childs.1 = node[1]
            }
            map[node[0]] = childs
        }
        let rootVal = parents.subtracting(children).first!
        let root = TreeNode(rootVal)
        var queue = [root]
        while !queue.isEmpty {
            var newQueue: [TreeNode] = []
            for node in queue {
                guard let childs = map[node.val] else { continue }
                if childs.0 > 0 {
                    let child = TreeNode(childs.0)
                    node.left = child
                    newQueue.append(child)
                }
                if childs.1 > 0 {
                    let child = TreeNode(childs.1)
                    node.right = child
                    newQueue.append(child)
                }
            }
            queue = newQueue
        }
        return root
    }
    
    func tests() {
        var root = createBinaryTree([[20,15,1],[20,17,0],[50,20,1],[50,80,0],[80,19,1]])
        print(root) // [50,20,80,15,17,19]
        
        root = createBinaryTree([[1,2,1],[2,3,0],[3,4,1]])
        print(root)// [1,2,null,null,3,4]
    }
}

