//import HeapModule
class MaximalScoreAfterApplyingKOperations {
//    func maxKelements2(_ nums: [Int], _ k: Int) -> Int {
//        var heap = HeapModule.Heap(nums)
//        var result = 0
//        for _ in 0..<k {
//            let num = heap.removeMax()
//            result += num
//            heap.insert((num + 2) / 3)
//        }
//        return result
//    }

    func maxKelements(_ nums: [Int], _ k: Int) -> Int {
        var heap = Heap(array: nums, sort: >)
        var result = 0
        for _ in 0..<k {
            let num = heap.remove()!
            result += num
            heap.insert((num + 2) / 3)
        }
        return result
    }
    
    func tests() {
        print(maxKelements([10,10,10,10,10], 5)) // 50
        print(maxKelements([1,10,3,3,3], 3)) // 17
    }
}

