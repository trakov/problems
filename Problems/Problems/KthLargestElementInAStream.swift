class KthLargestElementInAStreamHeap {
    private var heap = Heap<Int>(sort: <)
    private let k: Int
    
    init(_ k: Int = 0, _ nums: [Int] = []) {
        for num in nums {
            heap.insert(num)
            if heap.count > k {
                heap.remove()
            }
        }
        self.k = k
    }
    
    func add(_ val: Int) -> Int {
        if heap.count < k || heap.peek()! < val {
            heap.insert(val)
            if heap.count > k {
                heap.remove()
            }
        }
        return heap.peek()!
    }

    
    func tests() {
        let t = KthLargestElementInAStream(1, [])
        print(t.add(3)) // 4
        print(t.add(5)) // 5
        print(t.add(10)) // 5
        print(t.add(9)) // 8
        print(t.add(4)) // 8
    }
}

class KthLargestElementInAStream {
    private var nums: [Int]
    private let k: Int
    
    init(_ k: Int = 0, _ nums: [Int] = []) {
        self.nums = Array(nums.sorted(by: >).prefix(k))
        self.k = k
    }
    
    func add(_ val: Int) -> Int {
        nums.append(val)
        nums.sort(by: >)
        if nums.count > k {
            nums.removeLast()
        }
        return nums.last!
    }

    
    func tests() {
        let t = KthLargestElementInAStream(1, [])
        print(t.add(3)) // 4
        print(t.add(5)) // 5
        print(t.add(10)) // 5
        print(t.add(9)) // 8
        print(t.add(4)) // 8
    }
}
