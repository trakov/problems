class CloneGraph {
    public class Node {
        public var val: Int
        public var neighbors: [Node?]
        public init(_ val: Int) {
            self.val = val
            self.neighbors = []
        }
    }

    func cloneGraph(_ node: Node?) -> Node? {
        var visited: [Int: Node] = [:] // val: new_node
        func dfs(_ node: Node?) -> Node? {
            guard let node else { return nil }
            guard visited[node.val] == nil else { return visited[node.val] }
            let newNode = Node(node.val)
            visited[node.val] = newNode
            newNode.neighbors = node.neighbors.map { dfs($0) }
            return newNode
        }
        return dfs(node)
    }

    func cloneGraph2(_ node: Node?) -> Node? {
        var visited: [Int: Node] = [:] // val: new_node
        func dfs(_ node: Node?) -> Node? {
            guard let node else { return nil }
            let newNode = Node(node.val)
            visited[node.val] = newNode
            for neighbor in node.neighbors {
                guard let neighbor else { continue }
                let n = visited[neighbor.val] ?? dfs(neighbor)
                newNode.neighbors.append(n)
            }
            return newNode
        }
        return dfs(node)
    }
    
    func tests() {
        
    }
}
