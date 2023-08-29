protocol MyQueue {
    var size: Int { get }
    var isEmpty: Bool { get }
    mutating func pushBack(_ x: Int)
    func peekFront() -> Int?
    mutating func popFront() -> Int?
}

extension Array: MyQueue where Element == Int {
    var size: Int {
        count
    }

    mutating func pushBack(_ x: Int) {
        insert(x, at: 0)
    }
    
    func peekFront() -> Int? {
        first
    }
    
    mutating func popFront() -> Int? {
        isEmpty ? nil : removeFirst()
    }
}

class ImplementStackUsingQueues {
    class MyStack {

        private var queue: MyQueue = []
        
        init() {}
        
        func push(_ x: Int) {
            queue.pushBack(x)
            var size = queue.size
            while size > 1 {
                queue.pushBack(queue.popFront()!)
                size -= 1
            }
        }
        
        func pop() -> Int {
            queue.popFront()!
        }
        
        func top() -> Int {
            queue.peekFront()!
        }
        
        func empty() -> Bool {
            queue.isEmpty
        }
        
        func tests() {
            print(push(1))
            print(push(2))
            print(top())
            print(pop())
            print(empty())
        }
    }
}
