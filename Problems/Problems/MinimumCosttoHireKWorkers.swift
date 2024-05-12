class MinimumCosttoHireKWorkers {
    struct Heap<T: Comparable> {
        private var heap = [T]()
        private let comparator: (T, T)->Bool
        
        init(_ comparator: @escaping (T, T)->Bool) {
            self.comparator = comparator
        }
        
        subscript(i: Int) -> T {heap[i]}
        var isEmpty: Bool {heap.isEmpty}
        var count: Int {heap.count}
        
        mutating func push(_ val: T) {
            heap.append(val)
            var pos = heap.count-1
            while pos > 0 && comparator(heap[pos], heap[(pos-1)/2]) {
                heap.swapAt(pos, (pos-1)/2)
                pos = (pos-1)/2
            }
        }
        
        mutating func pop() -> T? {
            guard let ans = heap.first else {return nil }
            heap[0] = heap.last!
            var pos = 0
            while pos*2 + 2 < heap.count {
                let swapSonInd =
                    comparator(heap[pos*2 + 1], heap[pos*2 + 2]) ?
                    (pos*2 + 1) : (pos*2 + 2)
                if comparator(heap[swapSonInd], heap[pos]) {
                    heap.swapAt(pos, swapSonInd)
                    pos = swapSonInd
                } else {
                    break
                }
            }
            heap.popLast()
            return ans
        }
    }

    func mincostToHireWorkers(_ quality: [Int], _ wage: [Int], _ k: Int) -> Double {
        let workers = zip(wage, quality).map {
            (Double($0.0)/Double($0.1), $0.1)
        }.sorted { $0.0 < $1.0 }
        var maxHeap = Heap<Int>(>)
        var res = Double.infinity
        var qSum = 0
        for (ratio, q) in workers {
            maxHeap.push(q)
            qSum += q
            if maxHeap.count == k {
                res = min(res, Double(qSum)*ratio)
                qSum -= maxHeap.pop()!
            }
        }
        return res
    }
    
    func tests() {
        print(mincostToHireWorkers([10,20,5], [70,50,30], 2)) // 105.0
        print(mincostToHireWorkers([3,1,10,10,1], [4,8,2,2,7], 3)) // 30.66667
    }
}

