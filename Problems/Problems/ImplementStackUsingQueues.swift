class ImplementStackUsingQueues {
    class MyStack {

        private var queue: [Int]
        init() {
            queue = []
        }
        
        func push(_ x: Int) {
            queue.append(x)
        }
        
        func pop() -> Int {
            for _ in 0..<queue.count - 1 {
                push(queue.removeFirst())
            }
            return queue.removeFirst()
        }
        
        func top() -> Int {
            queue.last ?? 0
        }
        
        func empty() -> Bool {
            queue.isEmpty
        }
    }

}
