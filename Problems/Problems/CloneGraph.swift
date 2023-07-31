class CloneGraph {
//    func cloneGraph(_ node: Node?) -> Node? {
//        var visited = [Int: Node]()
//        return dfs(node, visited: &visited)
//    }
//    
//    func dfs(_ node: Node?, visited: inout [Int: Node]) -> Node? {
//        guard let node = node else { return nil }
//
//        let newNode = Node(node.val)
//        visited[node.val] = newNode
//
//        for neighbor in node.neighbors {
//            guard let neighbor = neighbor else { continue }
//
//            if let n = visited[neighbor.val] {
//                newNode.neighbors.append(n)
//            } else {
//                let n = dfs(neighbor, visited: &visited)
//                newNode.neighbors.append(n)
//            }
//        }
//
//        return newNode
//    }

    func tests() {
        
    }
}
