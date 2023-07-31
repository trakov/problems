class LRUCache {
    private class Node {
        var key: Int, value: Int
        var prev: Node?, next: Node?
        init(key: Int, value: Int) {
            self.key = key
            self.value = value
        }
    }

    private let capacity: Int
    private var cache = [Int: Node]()
    private let left = Node(key: 0, value: 0)
    private let right = Node(key: 0, value: 0)

    init(_ capacity: Int) {
        self.capacity = capacity
        (left.next, right.prev) = (right, left)
    }
    
    func get(_ key: Int) -> Int {
        guard let node = cache[key] else { return -1 }
        remove(node)
        insert(node)
        return node.value
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = cache[key] {
            remove(node)
        }
        cache[key] = Node(key: key, value: value)
        insert(cache[key]!)
        if cache.count > capacity {
            let least = left.next!
            remove(least)
            cache[least.key] = nil
        }
    }

    private func remove( _ node: Node) {
        (node.prev!.next, node.next!.prev) = (node.next, node.prev)
    }

    private func insert( _ node: Node) {
        let prev = right.prev!
        (prev.next, right.prev) = (node, node)
        (node.next, node.prev ) = (right, prev)
    }
    
    func tests() {
        let lru = LRUCache(2)
        print(lru.put(1, 1)) //
        print(lru.put(2, 2)) //
        print(lru.get(1)) // 1
        print(lru.put(3, 3)) //
        print(lru.get(2)) // -1
        print(lru.put(4, 4)) //
        print(lru.get(1)) // -1
        print(lru.get(3)) // 3
        print(lru.get(4)) // 4
    }
}
