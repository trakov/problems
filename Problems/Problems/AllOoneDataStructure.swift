class AllOoneDataStructure {
    class Node {
        var count: Int
        var keys: Set<String> = []
        var prev: Node?
        var next: Node?
        init(_ count: Int) {
            self.count = count
        }
    }

    private var map: [String: Node] = [:]
    private let left = Node(0)
    private let right = Node(0)
    init() {
        (left.next, right.prev) = (right, left)
    }
    
    func inc(_ key: String) {
        if let node = map[key] {
            node.keys.remove(key)
            let next = node.next!
            if node === right || next.count != node.count + 1 {
                let newNode = Node(node.count + 1)
                newNode.keys.insert(key)
                (newNode.prev, newNode.next) = (node, next)
                (next.prev, node.next) = (newNode, newNode)
                map[key] = newNode
            } else {
                next.keys.insert(key)
                map[key] = next
            }
            if node.keys.isEmpty {
                remove(node)
            }
        } else {
            let next = left.next!
            if next === right || next.count > 1 {
                let newNode = Node(1)
                newNode.keys.insert(key)
                (newNode.prev, newNode.next) = (left, next)
                (next.prev, left.next) = (newNode, newNode)
                map[key] = newNode
            } else {
                next.keys.insert(key)
                map[key] = next
            }
        }
    }
    
    func dec(_ key: String) {
        guard let node = map[key] else { return }
        node.keys.remove(key)
        if node.count == 1 {
            map[key] = nil
        } else {
            let prev = node.prev!
            if prev === left || prev.count != node.count - 1 {
                let newNode = Node(node.count - 1)
                newNode.keys.insert(key)
                (newNode.prev, newNode.next) = (prev, node)
                (prev.next, node.prev) = (newNode, newNode)
                map[key] = newNode
            } else {
                prev.keys.insert(key)
                map[key] = prev
            }
        }
        if node.keys.isEmpty {
            remove(node)
        }
    }
    
    func getMaxKey() -> String {
        if right.prev === left {
            return ""
        }
        return right.prev!.keys.first!
    }
    
    func getMinKey() -> String {
        if right.prev === left {
            return ""
        }
        return left.next!.keys.first!
    }
    
    private func remove(_ node: Node?) {
        (node!.prev!.next, node!.next!.prev) = (node?.next, node?.prev)
    }
    
    func tests() {
        print(inc("hello"))
        print(inc("hello"))
        print(getMaxKey()) // return "hello"
        print(getMinKey()) // return "hello"
        print(inc("leet"))
        print(getMaxKey()) // return "hello"
        print(getMinKey()) // return "leet"
    }
}

