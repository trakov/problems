class KeysAndRooms {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var queue: [Int] = rooms[0]
        var visited: Set<Int> = [0]
        while !queue.isEmpty {
            let size = queue.count
            for key in queue {
                if visited.insert(key).inserted {
                    queue.append(contentsOf: rooms[key])
                }
            }
            queue.removeFirst(size)
        }
        
        return visited.count == rooms.count
    }
    
    func canVisitAllRooms2(_ rooms: [[Int]]) -> Bool {
        var keys: Set<Int> = []
        visit(keys: &keys, rooms: rooms, key: 0)
        return keys.count == rooms.count
    }
    
    func visit(keys: inout Set<Int>, rooms: [[Int]], key: Int) {
        if keys.contains(key) {
            return
        }
        keys.insert(key)
        for doorKey in rooms[key] {
            visit(keys: &keys, rooms: rooms, key: doorKey)
        }
    }

    func tests() {
        print(canVisitAllRooms([[2],[3],[1],[]])) // true
        print(canVisitAllRooms([[1],[2],[3],[]])) // true
        print(canVisitAllRooms([[1,3],[3,0,1],[2],[0]])) // false
    }
}
