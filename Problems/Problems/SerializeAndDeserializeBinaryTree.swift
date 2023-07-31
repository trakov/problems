class SerializeAndDeserializeBinaryTree {
    func serialize(_ root: TreeNode?) -> String {
        guard let root = root else { return "-." }
        return "\(root.val)." + serialize(root.left) + serialize(root.right)
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        var queue: [String] = data.components(separatedBy: ".")
        return deserialize(&queue)
    }

    private func deserialize(_ queue: inout [String]) -> TreeNode? {
        guard let val = Int(queue.removeFirst()) else { return nil }
        let node = TreeNode(val)
        node.left = deserialize(&queue)
        node.right = deserialize(&queue)
        return node
    }

    func tests() {
        var node: TreeNode? = TreeNode(
            5,
            TreeNode(6),
            TreeNode(2, TreeNode(7), TreeNode(4))
        )
        var str = serialize(node)
        print(str)
        node = deserialize(str)
        print(serialize(node))
        
    }
}
