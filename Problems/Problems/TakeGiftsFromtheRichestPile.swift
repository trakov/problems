// import HeapModule
class TakeGiftsFromtheRichestPile {
//    func pickGifts(_ gifts: [Int], _ k: Int) -> Int {
//        var heap = Heap(gifts)
//        for i in 0..<k {
//            heap.insert(Int(Double(heap.popMax()!).squareRoot()))
//        }
//        return heap.unordered.reduce(0, +)
//    }

    func pickGifts(_ gifts: [Int], _ k: Int) -> Int {
        let gifts = gifts.map { $0 * (-1) }
        var heap = Heap(array: gifts, sort: <)
        for i in 0..<k {
            var maxElement = -heap.remove()!
            heap.insert(-Int(Double(maxElement).squareRoot()))
        }
        var result = 0
        while !heap.isEmpty {
            result -= heap.remove()!
        }
        return result
    }
    
    func tests() {
        print(pickGifts([25,64,9,4,100], 4)) // 29
        print(pickGifts([1,1,1,1], 4)) // 4
    }
}

