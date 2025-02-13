import HeapModule

class MinimumOperationstoExceedThresholdValueII {
    func minOperations2(_ nums: [Int], _ k: Int) -> Int {
        var heap = Heap<Int>(sort: <)
        for num in nums where num < k {
            heap.insert(num)
        }
        var result = 0
        while heap.count >= 2 {
            let a = heap.remove()!
            let b = heap.remove()!
            result += 1
            let val = a * 2 + b
            if val < k {
                heap.insert(val)
            }
        }
        return result + heap.count
    }
    
    func minOperations(_ nums: [Int], _ k: Int) -> Int {
        var heap = HeapModule.Heap<Int>()
        for num in nums where num < k {
            heap.insert(num)
        }
        var result = 0
        while heap.count >= 2 {
            let a = heap.popMin()!
            let b = heap.popMin()!
            result += 1
            let val = a * 2 + b
            if val < k {
                heap.insert(val)
            }
        }
        return result + heap.count
    }

    func tests() {
        print(minOperations([2,11,10,1,3], 10)) // 2
        print(minOperations([1,1,2,4,9], 20)) // 4
    }
}

