class DesignaStackWithIncrementOperation {
    private var array: [Int]
    private var inc: [Int]
    private var topIndex = -1
    init(_ maxSize: Int = 0) {
        array = Array(repeating: 0, count: maxSize)
        inc = Array(repeating: 0, count: maxSize)
    }
    
    func push(_ x: Int) {
        guard topIndex < array.count - 1 else { return }
        topIndex += 1
        array[topIndex] = x
    }
    
    func pop() -> Int {
        guard topIndex >= 0 else { return -1 }
        let result = array[topIndex] + inc[topIndex]
        if topIndex > 0 {
            inc[topIndex - 1] += inc[topIndex]
        }
        inc[topIndex] = 0
        topIndex -= 1
        return result
    }
    
    func increment(_ k: Int, _ val: Int) {
        guard topIndex >= 0 else { return }
        var incIndex = min(topIndex, k - 1)
        inc[incIndex] += val
    }
//    private var array: [Int] = []
//    private let maxSize: Int
//    init(_ maxSize: Int = 0) {
//        self.maxSize = maxSize
//    }
//    
//    func push(_ x: Int) {
//        guard array.count < maxSize else { return }
//        array.append(x)
//    }
//    
//    func pop() -> Int {
//        guard !array.isEmpty else { return -1 }
//        return array.removeLast()
//    }
//    
//    func increment(_ k: Int, _ val: Int) {
//        for i in 0..<min(k, array.count) {
//            array[i] += val
//        }
//    }
    
    func tests() {
        let stk = DesignaStackWithIncrementOperation(3)
        stk.push(1) // stack becomes [1]
        stk.push(2) // stack becomes [1, 2]
        print(stk.pop()) // return 2 --> Return top of the stack 2, stack becomes [1]
        stk.push(2) // stack becomes [1, 2]
        stk.push(3) // stack becomes [1, 2, 3]
        stk.push(4) // stack still [1, 2, 3], Do not add another elements as size is 4
        stk.increment(5, 100) // stack becomes [101, 102, 103]
        stk.increment(2, 100) // stack becomes [201, 202, 103]
        print(stk.pop()) // return 103 --> Return top of the stack 103, stack becomes [201, 202]
        print(stk.pop()) // return 202 --> Return top of the stack 202, stack becomes [201]
        print(stk.pop()) // return 201 --> Return top of the stack 201, stack becomes []
        print(stk.pop()) // return -1 --> Stack is empty return -1.
    }
}

