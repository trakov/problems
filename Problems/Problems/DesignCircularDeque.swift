class DesignCircularDeque {
    
    private let k: Int
    private var array: [Int]
    private var front = 0
    private var last = 0
    private var full = false
    
    init(_ k: Int) {
        self.k = k
        array = Array(repeating: 0, count: k)
    }
    
//  Adds an item at the front of Deque. Returns true if the operation is successful, or false otherwise.
    func insertFront(_ value: Int) -> Bool {
        guard !isFull() else { return false }
        front = (front - 1 + k) % k
        array[front] = value
        if last == front { full = true }
        return true
    }
    
//  Adds an item at the rear of Deque. Returns true if the operation is successful, or false otherwise.
    func insertLast(_ value: Int) -> Bool {
        guard !isFull() else { return false }
        array[last] = value
        last = (last + 1) % k
        if last == front { full = true }
        return true
    }
    
//  Deletes an item from the front of Deque. Returns true if the operation is successful, or false otherwise.
    func deleteFront() -> Bool {
        guard !isEmpty() else { return false }
        if isFull() { full = false }
        front = (front + 1) % k
        return true
    }
    
//    boolean deleteLast() Deletes an item from the rear of Deque. Returns true if the operation is successful, or false otherwise.
    func deleteLast() -> Bool {
        guard !isEmpty() else { return false }
        if isFull() { full = false }
        last = (last - 1 + k) % k
        return true
    }
    
//  Returns the front item from the Deque. Returns -1 if the deque is empty.
    func getFront() -> Int {
        isEmpty() ? -1 : array[front]
    }
    
//  Returns the last item from Deque. Returns -1 if the deque is empty.
    func getRear() -> Int {
        isEmpty() ? -1 : array[(last - 1 + k) % k]
    }
    
//  Returns true if the deque is empty, or false otherwise.
    func isEmpty() -> Bool {
        !isFull() && front == last
    }
    
//  Returns true if the deque is full, or false otherwise.
    func isFull() -> Bool {
        full
    }
}
