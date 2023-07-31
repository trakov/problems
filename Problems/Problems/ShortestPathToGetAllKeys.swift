class ShortestPathToGetAllKeys {
    func shortestPathAllKeys(_ grid: [String]) -> Int {
        let m = grid.count, n = grid[0].count
        let moves = [[0, 1], [1, 0], [-1, 0], [0, -1]]
        
        var seen = [Int: Set<Pair<Int, Int>>]()
        
        var keySet = Set<Character>()
        var lockSet = Set<Character>()
        var allKeys = 0
        var startR = -1, startC = -1
        let sgrid: [Array<Character>] = grid.map(Array.init)
        
        for i in 0..<m {
            for j in 0..<n {
                let cell = sgrid[i][j]
                if cell >= "a" && cell <= "f" {
                    allKeys += (1 << (cell.asciiValue! - Character("a").asciiValue!))
                    keySet.insert(cell)
                }
                if cell >= "A" && cell <= "F" {
                    lockSet.insert(cell)
                }
                if cell == "@" {
                    startR = i
                    startC = j
                }
            }
        }
        let queue = Queue<[Int]>()
        queue.enqueue([startR, startC, 0, 0])
        seen[0] = Set<Pair<Int, Int>>()
        seen[0]?.insert(Pair(startR, startC))
        
        while !queue.isEmpty {
            guard let cur = queue.dequeue() else { break }
            let curR = cur[0], curC = cur[1], keys = cur[2], dist = cur[3]

            for move in moves {
                let newR = curR + move[0], newC = curC + move[1]
                
                if newR >= 0 && newR < m && newC >= 0 && newC < n && sgrid[newR][newC] != "#" {
                    let cell = sgrid[newR][newC]
                    
                    if keySet.contains(cell) {
                        if ((1 << (cell.asciiValue! - Character("a").asciiValue!)) & keys) != 0 {
                            continue
                        }
                        
                        let newKeys = (keys | (1 << (cell.asciiValue! - Character("a").asciiValue!)))
                        
                        if newKeys == allKeys {
                            return dist + 1
                        }
                        if seen[newKeys] == nil {
                            seen[newKeys] = Set<Pair<Int, Int>>()
                        }
                        seen[newKeys]?.insert(Pair(newR, newC))
                        queue.enqueue([newR, newC, newKeys, dist + 1])
                    }
                    
                    if lockSet.contains(cell) && ((keys & (1 << (cell.asciiValue! - Character("A").asciiValue!))) == 0) {
                        continue
                    } else if !(seen[keys]?.contains(Pair(newR, newC)) ?? false) {
                        seen[keys]?.insert(Pair(newR, newC))
                        queue.enqueue([newR, newC, keys, dist + 1])
                    }
                }
            }
        }
        
        return -1
    }

    struct Pair<A: Hashable, B: Hashable>: Hashable {
        let first: A
        let second: B
        init(_ first: A, _ second: B) {
            self.first = first
            self.second = second
        }
    }

    class Node<T> {
        var value: T
        var next: Node<T>?
        weak var previous: Node<T>?

        init(value: T) {
            self.value = value
        }
    }

    public class LinkedList<T> {
        private var head: Node<T>?
        private var tail: Node<T>?

        var isEmpty: Bool {
            return head == nil
        }

        var first: Node<T>? {
            return head
        }

        var last: Node<T>? {
            return tail
        }

        func append(value: T) {
            let newNode = Node(value: value)
            if let tailNode = tail {
                newNode.previous = tailNode
                tailNode.next = newNode
            } else {
                head = newNode
            }
            tail = newNode
        }

        func remove(node: Node<T>) -> T {
            let prev = node.previous
            let next = node.next

            if let prev = prev {
                prev.next = next
            } else {
                head = next
            }

            next?.previous = prev

            if next == nil {
                tail = prev
            }

            node.previous = nil
            node.next = nil

            return node.value
        }
    }

    struct Queue<T> {
        private var list = LinkedList<T>()

        var isEmpty: Bool {
            return list.isEmpty
        }

        func enqueue(_ element: T) {
            list.append(value: element)
        }

        func dequeue() -> T? {
            guard !list.isEmpty, let element = list.first else { return nil }
            return list.remove(node: element)
        }

        func peek() -> T? {
            return list.first?.value
        }
    }

    func tests() {
        print(shortestPathAllKeys(["@.a..","###.#","b.A.B"])) // 8
        print(shortestPathAllKeys(["@..aA","..B#.","....b"])) // 6
        print(shortestPathAllKeys(["@Aa"])) // -1
    }
}

