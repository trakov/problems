class DesignCircularQueue {

    private var array: [Int?]
    private var head = -1
    private var tail = -1
    private let k: Int
    init(_ k: Int) {
        self.k = k
        array = Array(repeating: nil, count: k)
    }
    
    func enQueue(_ value: Int) -> Bool {
        guard !isFull() else { return false }
        tail = (tail + 1) % k
        array[tail] = value
        if head == -1 {
            head = 0
        }
        return true
    }
    
    func deQueue() -> Bool {
        guard !isEmpty() else { return false }
        if head == tail {
            head = -1
            tail = -1
        } else {
            head = (head + 1) % k
        }
        return true
    }
    
    func Front() -> Int {
        guard head >= 0 else { return -1 }
        return array[head] ?? -1
    }
    
    func Rear() -> Int {
        guard tail >= 0 else { return -1 }
        return array[tail] ?? -1
    }
    
    func isEmpty() -> Bool {
        head == -1
    }
    
    func isFull() -> Bool {
        guard head != -1 else { return false }
        return (k + tail - head) % k == k - 1
    }
    
    static func tests() {
//        ["MyCircularQueue","enQueue","Rear","Rear","deQueue","enQueue","Rear","deQueue","Front","deQueue","deQueue","deQueue"]
//        [[6],[6],[],[],[],[5],[],[],[],[],[],[]]


//        let queue = DesignCircularQueue(6)
//        print(queue.enQueue(6))
//        print(queue.Rear())
//        print(queue.Rear())
////        print(queue.isFull())
////        print(queue.isEmpty())
//        print(queue.deQueue())
//        print(queue.enQueue(5))
//        print(queue.Rear())
//        print(queue.deQueue())
//        print(queue.Front())
//        print(queue.deQueue())
//        print(queue.deQueue())
//        print(queue.deQueue())
        
        ["MyCircularQueue","enQueue","enQueue","enQueue","enQueue","Rear","isFull","deQueue","enQueue","Rear"]
        [[3],[1],[2],[3],[4],[],[],[],[4],[]]
        
        let queue = DesignCircularQueue(3)
        print(queue.enQueue(1))
        print(queue.enQueue(2))
        print(queue.enQueue(3))
        print(queue.enQueue(4))
        print(queue.Rear())
        print(queue.isFull())
        print(queue.deQueue())
        print(queue.enQueue(4))
        print(queue.Rear())
    }
}
